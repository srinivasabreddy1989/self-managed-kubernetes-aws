# Ansible cluster automation

The shared playbook configures kubeadm clusters over AWS Systems Manager. The nonprod GitHub workflow creates infrastructure, waits for SSM, and then runs the playbook. Production inventory and variables are included for the later production backend/workflow; production Terraform is not run by CI yet.

## Versions and environment

The environment files pin Kubernetes 1.37.2, containerd 2.2.1, cri-tools 1.37.0, and Calico 3.33.0. Validate package availability from the Ubuntu 24.04 image before changing these pins. The nonprod topology is one control plane and two workers; prod expects three of each.

## Local playbook checks

Run from a Linux controller (Ubuntu, WSL2, or the GitHub-hosted Ubuntu runner):

```bash
cd ansible
python -m pip install -r requirements.txt
ansible-galaxy collection install -r requirements.yml
ansible-playbook -i inventory/nonprod.aws_ec2.yml site.yml \
  -e @environments/nonprod.yml --syntax-check
```

A live run also requires AWS credentials that can describe the tagged EC2 nodes, use Systems Manager sessions, and access the SSM transfer bucket. Set `KUBERNETES_API_ENDPOINT` and `ANSIBLE_SSM_BUCKET_NAME` in the controller environment. The playbook never runs `kubeadm reset`; it initializes missing control-plane state and joins only nodes without `/etc/kubernetes/kubelet.conf`.

## GitHub setup

Before the first workflow run, enable versioning on the existing state bucket:

```bash
aws s3api put-bucket-versioning \
  --bucket terraform-statefile-srinivasa \
  --versioning-configuration Status=Enabled
```

The nonprod workflows use the OIDC role `self-managed-kubernetes-setup` in account `982468346394`. Because the jobs use GitHub Environments, its OIDC trust policy must allow the subjects `repo:<OWNER>/<REPO>:environment:nonprod` and `repo:<OWNER>/<REPO>:environment:nonprod-destroy`, with audience `sts.amazonaws.com`. Restrict both GitHub Environments to the `master` deployment branch; require reviewers for `nonprod-destroy`. Set the non-secret GitHub Environment variable `NONPROD_ADMIN_CIDR` to the trusted administrator IPv4 CIDR (preferably `/32`); the workflow passes it to Terraform as `TF_VAR_admin_cidr`. Its permissions must cover:

- Terraform actions for the nonprod EC2, VPC, IAM, security-group, EIP, and S3 transfer-bucket resources, including `iam:PassRole` for the node instance profile.
- S3 state access to `Nonprod/vpc/terraform.tfstate` and its `.tflock` object, plus `s3:ListBucket` scoped to that prefix and `s3:GetBucketVersioning` on the state bucket.
- `ec2:DescribeInstances`, `ssm:DescribeInstanceInformation`, `ssm:StartSession`, and `ssm:TerminateSession` for the nonprod nodes.
- `s3:GetBucketLocation`, `s3:ListBucket`, `s3:GetObject`, `s3:PutObject`, and `s3:DeleteObject` on the dedicated SSM transfer bucket.

The SSM plugin needs a transfer bucket because Ansible modules are sent through S3. Terraform creates a separate private, unversioned bucket with one-day expiration; do not point it at the versioned Terraform state bucket. The EC2 nodes need outbound access to SSM and S3. The state bucket currently reports versioning as disabled; enable S3 versioning before either workflow runs, or the preflight guard will fail. Configure GitHub Environments `nonprod` and `nonprod-destroy`; protect the latter with required reviewers. The destroy workflow is manual, requires a typed confirmation, displays a resource summary and digest in plan mode, then requires that reviewed digest on a second run before applying the same plan generated in that run.

Terraform state and plans are never uploaded as workflow artifacts. The S3 backend key is `Nonprod/vpc/terraform.tfstate`; the workflow checks bucket versioning before use. Do not run `terraform init -migrate-state` unless a non-empty local state has been deliberately reconciled.
