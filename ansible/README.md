# Ansible cluster automation

The shared playbook configures kubeadm clusters over AWS Systems Manager. The nonprod and prod GitHub workflows create their infrastructure, wait for SSM, then run the same playbook with separate inventory and topology variables.

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

A live run also requires AWS credentials that can describe the tagged EC2 nodes, use Systems Manager sessions, and access the SSM transfer bucket. Set `KUBERNETES_API_ENDPOINT` to the private API endpoint reachable by cluster nodes and `ANSIBLE_SSM_BUCKET_NAME` in the controller environment. Nonprod also exports `KUBERNETES_PUBLIC_API_ENDPOINT` for administrator access; do not use that public EIP as kubeadm's in-cluster endpoint. The playbook never runs `kubeadm reset`; it initializes missing control-plane state and joins only nodes without `/etc/kubernetes/kubelet.conf`.

## GitHub setup

Before the first workflow run, enable versioning on the existing state bucket:

```bash
aws s3api put-bucket-versioning \
  --bucket terraform-statefile-srinivasa \
  --versioning-configuration Status=Enabled
```

The workflows use the OIDC role `self-managed-kubernetes-setup` in account `982468346394`. Its trust policy must allow the subjects `repo:<OWNER>/<REPO>:environment:nonprod`, `repo:<OWNER>/<REPO>:environment:nonprod-destroy`, and `repo:<OWNER>/<REPO>:environment:prod`, with audience `sts.amazonaws.com`. Restrict these GitHub Environments to the `master` deployment branch and require reviewers for `nonprod-destroy` and `prod`. Set the repository-level Actions variable `NONPROD_ADMIN_CIDR` to the trusted administrator IPv4 CIDR (preferably `/32`); nonprod passes it to Terraform as `TF_VAR_admin_cidr`. The role currently has broad `AdministratorAccess`; reduce it to least privilege after the workflows are verified. It must cover:

- Terraform actions for both environments' EC2, VPC, IAM, security-group, EIP, NLB, target-group, listener, and S3 transfer-bucket resources, including `iam:PassRole` for each node instance profile.
- S3 state access to `Nonprod/vpc/terraform.tfstate`, `Production/vpc/terraform.tfstate`, and both `.tflock` objects, plus `s3:ListBucket` scoped to those prefixes and `s3:GetBucketVersioning` on the state bucket.
- `ec2:DescribeInstances`, `ssm:DescribeInstanceInformation`, `ssm:StartSession`, and `ssm:TerminateSession` for the tagged nonprod and production nodes.
- `s3:GetBucketLocation`, `s3:ListBucket`, `s3:GetObject`, `s3:PutObject`, and `s3:DeleteObject` on both dedicated SSM transfer buckets.

The SSM plugin needs a transfer bucket because Ansible modules are sent through S3. Terraform creates a separate private, unversioned bucket per environment with one-day expiration; do not point it at the versioned Terraform state bucket. The EC2 nodes need outbound access to SSM and S3. The state bucket must have versioning enabled; both workflows check this before running. The nonprod state key is `Nonprod/vpc/terraform.tfstate`; production uses `Production/vpc/terraform.tfstate`. Production deploy and destroy runs use the protected `prod` GitHub Environment. Both destroy workflows are manual, require typed confirmation, display a resource summary and digest in plan mode, then require that reviewed digest on a second run before applying destruction. The production destroy workflow disables NLB deletion protection only after that confirmation and approval.

Terraform state and plans are never uploaded as workflow artifacts. Production variables are committed in the nonsecret `Environments/prod/production.auto.tfvars`. Do not run `terraform init -migrate-state` unless a non-empty local state has been deliberately reconciled.
