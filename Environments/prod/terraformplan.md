PS C:\Users\Srinivasa Reddy B\Desktop\Github\self-managed-kubernetes-aws\Environments\prod> terraform init
Initializing the backend...
Initializing modules...
Initializing provider plugins...
- Reusing previous version of hashicorp/aws from the dependency lock file
- Using previously-installed hashicorp/aws v6.72.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
PS C:\Users\Srinivasa Reddy B\Desktop\Github\self-managed-kubernetes-aws\Environments\prod> terraform validate
Success! The configuration is valid.

PS C:\Users\Srinivasa Reddy B\Desktop\Github\self-managed-kubernetes-aws\Environments\prod> terraform plan
module.ec2.data.aws_ami.ubuntu: Reading...
module.ec2.data.aws_ami.ubuntu: Read complete after 2s [id=ami-08b275ac6cc5dbefb]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.ec2.aws_instance.control_plane["us-east-1a"] will be created
  + resource "aws_instance" "control_plane" {
      + ami                                  = "ami-08b275ac6cc5dbefb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = true
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prod-k8s-node-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "AZ"          = "us-east-1a"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-us-east-1a"
          + "Project"     = "kubernetes"
          + "Role"        = "control-plane"
        }
      + tags_all                             = {
          + "AZ"          = "us-east-1a"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-us-east-1a"
          + "Project"     = "kubernetes"
          + "Role"        = "control-plane"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 50
          + volume_type           = "gp3"
        }

      + secondary_network_interface (known after apply)
    }

  # module.ec2.aws_instance.control_plane["us-east-1b"] will be created
  + resource "aws_instance" "control_plane" {
      + ami                                  = "ami-08b275ac6cc5dbefb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = true
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prod-k8s-node-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "AZ"          = "us-east-1b"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-us-east-1b"
          + "Project"     = "kubernetes"
          + "Role"        = "control-plane"
        }
      + tags_all                             = {
          + "AZ"          = "us-east-1b"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-us-east-1b"
          + "Project"     = "kubernetes"
          + "Role"        = "control-plane"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 50
          + volume_type           = "gp3"
        }

      + secondary_network_interface (known after apply)
    }

  # module.ec2.aws_instance.control_plane["us-east-1c"] will be created
  + resource "aws_instance" "control_plane" {
      + ami                                  = "ami-08b275ac6cc5dbefb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = true
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prod-k8s-node-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "AZ"          = "us-east-1c"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-us-east-1c"
          + "Project"     = "kubernetes"
          + "Role"        = "control-plane"
        }
      + tags_all                             = {
          + "AZ"          = "us-east-1c"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-us-east-1c"
          + "Project"     = "kubernetes"
          + "Role"        = "control-plane"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 50
          + volume_type           = "gp3"
        }

      + secondary_network_interface (known after apply)
    }

  # module.ec2.aws_instance.worker["us-east-1a"] will be created
  + resource "aws_instance" "worker" {
      + ami                                  = "ami-08b275ac6cc5dbefb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = true
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prod-k8s-node-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "AZ"          = "us-east-1a"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-us-east-1a"
          + "Project"     = "kubernetes"
          + "Role"        = "worker"
        }
      + tags_all                             = {
          + "AZ"          = "us-east-1a"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-us-east-1a"
          + "Project"     = "kubernetes"
          + "Role"        = "worker"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 100
          + volume_type           = "gp3"
        }

      + secondary_network_interface (known after apply)
    }

  # module.ec2.aws_instance.worker["us-east-1b"] will be created
  + resource "aws_instance" "worker" {
      + ami                                  = "ami-08b275ac6cc5dbefb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = true
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prod-k8s-node-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "AZ"          = "us-east-1b"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-us-east-1b"
          + "Project"     = "kubernetes"
          + "Role"        = "worker"
        }
      + tags_all                             = {
          + "AZ"          = "us-east-1b"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-us-east-1b"
          + "Project"     = "kubernetes"
          + "Role"        = "worker"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 100
          + volume_type           = "gp3"
        }

      + secondary_network_interface (known after apply)
    }

  # module.ec2.aws_instance.worker["us-east-1c"] will be created
  + resource "aws_instance" "worker" {
      + ami                                  = "ami-08b275ac6cc5dbefb"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = true
      + enable_primary_ipv6                  = (known after apply)
      + force_destroy                        = false
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = "prod-k8s-node-profile"
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t3.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_group_id                   = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + region                               = "us-east-1"
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "AZ"          = "us-east-1c"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-us-east-1c"
          + "Project"     = "kubernetes"
          + "Role"        = "worker"
        }
      + tags_all                             = {
          + "AZ"          = "us-east-1c"
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-us-east-1c"
          + "Project"     = "kubernetes"
          + "Role"        = "worker"
        }
      + tenancy                              = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = "disabled"
          + http_put_response_hop_limit = 1
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + network_interface (known after apply)

      + primary_network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device {
          + delete_on_termination = true
          + device_name           = (known after apply)
          + encrypted             = true
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags_all              = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = 100
          + volume_type           = "gp3"
        }

      + secondary_network_interface (known after apply)
    }

  # module.iam.aws_iam_instance_profile.k8s_node_profile will be created
  + resource "aws_iam_instance_profile" "k8s_node_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = "prod-k8s-node-profile"
      + name_prefix = (known after apply)
      + path        = "/"
      + role        = "prod-k8s-node-role"
      + tags        = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-node-profile"
          + "Project"     = "kubernetes"
        }
      + tags_all    = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-node-profile"
          + "Project"     = "kubernetes"
        }
      + unique_id   = (known after apply)
    }

  # module.iam.aws_iam_role.k8s_node_role will be created
  + resource "aws_iam_role" "k8s_node_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "prod-k8s-node-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags                  = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-node-role"
          + "Project"     = "kubernetes"
        }
      + tags_all              = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-node-role"
          + "Project"     = "kubernetes"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # module.iam.aws_iam_role_policy_attachment.ssm_core will be created
  + resource "aws_iam_role_policy_attachment" "ssm_core" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      + role       = "prod-k8s-node-role"
    }

  # module.load_balancer.aws_lb.kubernetes_api will be created
  + resource "aws_lb" "kubernetes_api" {
      + arn                                                          = (known after apply)
      + arn_suffix                                                   = (known after apply)
      + dns_name                                                     = (known after apply)
      + dns_record_client_routing_policy                             = "any_availability_zone"
      + enable_cross_zone_load_balancing                             = true
      + enable_deletion_protection                                   = true
      + enable_prefix_for_ipv6_source_nat                            = (known after apply)
      + enable_zonal_shift                                           = false
      + enforce_security_group_inbound_rules_on_private_link_traffic = (known after apply)
      + id                                                           = (known after apply)
      + internal                                                     = true
      + ip_address_type                                              = (known after apply)
      + load_balancer_type                                           = "network"
      + name                                                         = "prod-k8s-api-nlb"
      + name_prefix                                                  = (known after apply)
      + region                                                       = "us-east-1"
      + secondary_ips_auto_assigned_per_subnet                       = (known after apply)
      + security_groups                                              = (known after apply)
      + subnets                                                      = (known after apply)
      + tags                                                         = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-api-nlb"
          + "Project"     = "kubernetes"
        }
      + tags_all                                                     = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-api-nlb"
          + "Project"     = "kubernetes"
        }
      + vpc_id                                                       = (known after apply)
      + zone_id                                                      = (known after apply)

      + subnet_mapping (known after apply)
    }

  # module.load_balancer.aws_lb_listener.kubernetes_api will be created
  + resource "aws_lb_listener" "kubernetes_api" {
      + arn                                                                   = (known after apply)
      + id                                                                    = (known after apply)
      + load_balancer_arn                                                     = (known after apply)
      + port                                                                  = 6443
      + protocol                                                              = "TCP"
      + region                                                                = "us-east-1"
      + routing_http_request_x_amzn_mtls_clientcert_header_name               = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_issuer_header_name        = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_leaf_header_name          = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_subject_header_name       = (known after apply)
      + routing_http_request_x_amzn_mtls_clientcert_validity_header_name      = (known after apply)
      + routing_http_request_x_amzn_tls_cipher_suite_header_name              = (known after apply)
      + routing_http_request_x_amzn_tls_version_header_name                   = (known after apply)
      + routing_http_response_access_control_allow_credentials_header_value   = (known after apply)
      + routing_http_response_access_control_allow_headers_header_value       = (known after apply)
      + routing_http_response_access_control_allow_methods_header_value       = (known after apply)
      + routing_http_response_access_control_allow_origin_header_value        = (known after apply)
      + routing_http_response_access_control_expose_headers_header_value      = (known after apply)
      + routing_http_response_access_control_max_age_header_value             = (known after apply)
      + routing_http_response_content_security_policy_header_value            = (known after apply)
      + routing_http_response_server_enabled                                  = (known after apply)
      + routing_http_response_strict_transport_security_header_value          = (known after apply)
      + routing_http_response_x_content_type_options_header_value             = (known after apply)
      + routing_http_response_x_frame_options_header_value                    = (known after apply)
      + ssl_policy                                                            = (known after apply)
      + tags_all                                                              = (known after apply)
      + tcp_idle_timeout_seconds                                              = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }

      + mutual_authentication (known after apply)
    }

  # module.load_balancer.aws_lb_target_group.kubernetes_api will be created
  + resource "aws_lb_target_group" "kubernetes_api" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = (known after apply)
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancer_arns                 = (known after apply)
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_anomaly_mitigation  = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = "prod-k8s-api-tg"
      + name_prefix                        = (known after apply)
      + port                               = 6443
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "TCP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + region                             = "us-east-1"
      + slow_start                         = 0
      + tags                               = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-api-tg"
          + "Project"     = "kubernetes"
        }
      + tags_all                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-api-tg"
          + "Project"     = "kubernetes"
        }
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = (known after apply)
          + path                = (known after apply)
          + port                = "traffic-port"
          + protocol            = "TCP"
          + timeout             = (known after apply)
          + unhealthy_threshold = 3
        }

      + stickiness (known after apply)

      + target_failover (known after apply)

      + target_group_health (known after apply)

      + target_health_state (known after apply)
    }

  # module.load_balancer.aws_lb_target_group_attachment.control_plane["us-east-1a"] will be created
  + resource "aws_lb_target_group_attachment" "control_plane" {
      + id               = (known after apply)
      + port             = 6443
      + region           = "us-east-1"
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # module.load_balancer.aws_lb_target_group_attachment.control_plane["us-east-1b"] will be created
  + resource "aws_lb_target_group_attachment" "control_plane" {
      + id               = (known after apply)
      + port             = 6443
      + region           = "us-east-1"
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # module.load_balancer.aws_lb_target_group_attachment.control_plane["us-east-1c"] will be created
  + resource "aws_lb_target_group_attachment" "control_plane" {
      + id               = (known after apply)
      + port             = 6443
      + region           = "us-east-1"
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # module.networking.aws_eip.nat["us-east-1a"] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + region               = "us-east-1"
      + tags                 = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-eip-us-east-1a"
          + "Project"     = "kubernetes"
        }
      + tags_all             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-eip-us-east-1a"
          + "Project"     = "kubernetes"
        }
    }

  # module.networking.aws_eip.nat["us-east-1b"] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + region               = "us-east-1"
      + tags                 = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-eip-us-east-1b"
          + "Project"     = "kubernetes"
        }
      + tags_all             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-eip-us-east-1b"
          + "Project"     = "kubernetes"
        }
    }

  # module.networking.aws_eip.nat["us-east-1c"] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + region               = "us-east-1"
      + tags                 = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-eip-us-east-1c"
          + "Project"     = "kubernetes"
        }
      + tags_all             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-eip-us-east-1c"
          + "Project"     = "kubernetes"
        }
    }

  # module.networking.aws_internet_gateway.main will be created
  + resource "aws_internet_gateway" "main" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + region   = "us-east-1"
      + tags     = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-igw"
          + "Project"     = "kubernetes"
        }
      + tags_all = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-igw"
          + "Project"     = "kubernetes"
        }
      + vpc_id   = (known after apply)
    }

  # module.networking.aws_nat_gateway.main["us-east-1a"] will be created
  + resource "aws_nat_gateway" "main" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + auto_provision_zones               = (known after apply)
      + auto_scaling_ips                   = (known after apply)
      + availability_mode                  = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + region                             = "us-east-1"
      + regional_nat_gateway_address       = (known after apply)
      + regional_nat_gateway_auto_mode     = (known after apply)
      + route_table_id                     = (known after apply)
      + secondary_allocation_ids           = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-us-east-1a"
          + "Project"     = "kubernetes"
        }
      + tags_all                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-us-east-1a"
          + "Project"     = "kubernetes"
        }
      + vpc_id                             = (known after apply)
    }

  # module.networking.aws_nat_gateway.main["us-east-1b"] will be created
  + resource "aws_nat_gateway" "main" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + auto_provision_zones               = (known after apply)
      + auto_scaling_ips                   = (known after apply)
      + availability_mode                  = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + region                             = "us-east-1"
      + regional_nat_gateway_address       = (known after apply)
      + regional_nat_gateway_auto_mode     = (known after apply)
      + route_table_id                     = (known after apply)
      + secondary_allocation_ids           = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-us-east-1b"
          + "Project"     = "kubernetes"
        }
      + tags_all                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-us-east-1b"
          + "Project"     = "kubernetes"
        }
      + vpc_id                             = (known after apply)
    }

  # module.networking.aws_nat_gateway.main["us-east-1c"] will be created
  + resource "aws_nat_gateway" "main" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + auto_provision_zones               = (known after apply)
      + auto_scaling_ips                   = (known after apply)
      + availability_mode                  = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + region                             = "us-east-1"
      + regional_nat_gateway_address       = (known after apply)
      + regional_nat_gateway_auto_mode     = (known after apply)
      + route_table_id                     = (known after apply)
      + secondary_allocation_ids           = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-us-east-1c"
          + "Project"     = "kubernetes"
        }
      + tags_all                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nat-us-east-1c"
          + "Project"     = "kubernetes"
        }
      + vpc_id                             = (known after apply)
    }

  # module.networking.aws_route.private_nat["us-east-1a"] will be created
  + resource "aws_route" "private_nat" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + region                 = "us-east-1"
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # module.networking.aws_route.private_nat["us-east-1b"] will be created
  + resource "aws_route" "private_nat" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + region                 = "us-east-1"
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # module.networking.aws_route.private_nat["us-east-1c"] will be created
  + resource "aws_route" "private_nat" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + region                 = "us-east-1"
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # module.networking.aws_route.public_internet will be created
  + resource "aws_route" "public_internet" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + region                 = "us-east-1"
      + route_table_id         = (known after apply)
      + state                  = (known after apply)
    }

  # module.networking.aws_route_table.private["us-east-1a"] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = (known after apply)
      + tags             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-rt-us-east-1a"
          + "Project"     = "kubernetes"
        }
      + tags_all         = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-rt-us-east-1a"
          + "Project"     = "kubernetes"
        }
      + vpc_id           = (known after apply)
    }

  # module.networking.aws_route_table.private["us-east-1b"] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = (known after apply)
      + tags             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-rt-us-east-1b"
          + "Project"     = "kubernetes"
        }
      + tags_all         = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-rt-us-east-1b"
          + "Project"     = "kubernetes"
        }
      + vpc_id           = (known after apply)
    }

  # module.networking.aws_route_table.private["us-east-1c"] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = (known after apply)
      + tags             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-rt-us-east-1c"
          + "Project"     = "kubernetes"
        }
      + tags_all         = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-rt-us-east-1c"
          + "Project"     = "kubernetes"
        }
      + vpc_id           = (known after apply)
    }

  # module.networking.aws_route_table.public will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + region           = "us-east-1"
      + route            = (known after apply)
      + tags             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-rt"
          + "Project"     = "kubernetes"
        }
      + tags_all         = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-rt"
          + "Project"     = "kubernetes"
        }
      + vpc_id           = (known after apply)
    }

  # module.networking.aws_route_table_association.private["us-east-1a"] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networking.aws_route_table_association.private["us-east-1b"] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networking.aws_route_table_association.private["us-east-1c"] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networking.aws_route_table_association.public["us-east-1a"] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networking.aws_route_table_association.public["us-east-1b"] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networking.aws_route_table_association.public["us-east-1c"] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + region         = "us-east-1"
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.networking.aws_subnet.private["us-east-1a"] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.30.11.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-us-east-1a"
          + "Project"     = "kubernetes"
          + "Tier"        = "private"
        }
      + tags_all                                       = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-us-east-1a"
          + "Project"     = "kubernetes"
          + "Tier"        = "private"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networking.aws_subnet.private["us-east-1b"] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.30.12.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-us-east-1b"
          + "Project"     = "kubernetes"
          + "Tier"        = "private"
        }
      + tags_all                                       = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-us-east-1b"
          + "Project"     = "kubernetes"
          + "Tier"        = "private"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networking.aws_subnet.private["us-east-1c"] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.30.13.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-us-east-1c"
          + "Project"     = "kubernetes"
          + "Tier"        = "private"
        }
      + tags_all                                       = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-private-us-east-1c"
          + "Project"     = "kubernetes"
          + "Tier"        = "private"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networking.aws_subnet.public["us-east-1a"] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.30.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-us-east-1a"
          + "Project"     = "kubernetes"
          + "Tier"        = "public"
        }
      + tags_all                                       = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-us-east-1a"
          + "Project"     = "kubernetes"
          + "Tier"        = "public"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networking.aws_subnet.public["us-east-1b"] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.30.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-us-east-1b"
          + "Project"     = "kubernetes"
          + "Tier"        = "public"
        }
      + tags_all                                       = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-us-east-1b"
          + "Project"     = "kubernetes"
          + "Tier"        = "public"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networking.aws_subnet.public["us-east-1c"] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1c"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.30.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block                                = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + region                                         = "us-east-1"
      + tags                                           = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-us-east-1c"
          + "Project"     = "kubernetes"
          + "Tier"        = "public"
        }
      + tags_all                                       = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-public-us-east-1c"
          + "Project"     = "kubernetes"
          + "Tier"        = "public"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.networking.aws_vpc.main will be created
  + resource "aws_vpc" "main" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.30.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + region                               = "us-east-1"
      + tags                                 = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-vpc"
          + "Project"     = "kubernetes"
        }
      + tags_all                             = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-vpc"
          + "Project"     = "kubernetes"
        }
    }

  # module.security_groups.aws_security_group.control_plane will be created
  + resource "aws_security_group" "control_plane" {
      + arn                    = (known after apply)
      + description            = "Security group for Kubernetes control-plane nodes"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "prod-k8s-control-plane-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-sg"
          + "Project"     = "kubernetes"
        }
      + tags_all               = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-control-plane-sg"
          + "Project"     = "kubernetes"
        }
      + vpc_id                 = (known after apply)
    }

  # module.security_groups.aws_security_group.load_balancer will be created
  + resource "aws_security_group" "load_balancer" {
      + arn                    = (known after apply)
      + description            = "Security group for internal Kubernetes API NLB"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "prod-k8s-nlb-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nlb-sg"
          + "Project"     = "kubernetes"
        }
      + tags_all               = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-nlb-sg"
          + "Project"     = "kubernetes"
        }
      + vpc_id                 = (known after apply)
    }

  # module.security_groups.aws_security_group.worker will be created
  + resource "aws_security_group" "worker" {
      + arn                    = (known after apply)
      + description            = "Security group for Kubernetes worker nodes"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "prod-k8s-worker-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + region                 = "us-east-1"
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-sg"
          + "Project"     = "kubernetes"
        }
      + tags_all               = {
          + "Environment" = "production"
          + "ManagedBy"   = "terraform"
          + "Name"        = "prod-k8s-worker-sg"
          + "Project"     = "kubernetes"
        }
      + vpc_id                 = (known after apply)
    }

  # module.security_groups.aws_vpc_security_group_egress_rule.control_plane_all will be created
  + resource "aws_vpc_security_group_egress_rule" "control_plane_all" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Outbound traffic"
      + id                     = (known after apply)
      + ip_protocol            = "-1"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
    }

  # module.security_groups.aws_vpc_security_group_egress_rule.nlb_to_control_plane will be created
  + resource "aws_vpc_security_group_egress_rule" "nlb_to_control_plane" {
      + arn                          = (known after apply)
      + description                  = "NLB to control-plane API servers"
      + from_port                    = 6443
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 6443
    }

  # module.security_groups.aws_vpc_security_group_egress_rule.worker_all will be created
  + resource "aws_vpc_security_group_egress_rule" "worker_all" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "0.0.0.0/0"
      + description            = "Outbound traffic"
      + id                     = (known after apply)
      + ip_protocol            = "-1"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.api_server will be created
  + resource "aws_vpc_security_group_ingress_rule" "api_server" {
      + arn                          = (known after apply)
      + description                  = "Kubernetes API from internal NLB"
      + from_port                    = 6443
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 6443
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.calico_vxlan will be created
  + resource "aws_vpc_security_group_ingress_rule" "calico_vxlan" {
      + arn                          = (known after apply)
      + description                  = "Calico VXLAN from workers"
      + from_port                    = 4789
      + id                           = (known after apply)
      + ip_protocol                  = "udp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 4789
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.calico_vxlan_from_control_plane will be created
  + resource "aws_vpc_security_group_ingress_rule" "calico_vxlan_from_control_plane" {
      + arn                          = (known after apply)
      + description                  = "Calico VXLAN from control plane"
      + from_port                    = 4789
      + id                           = (known after apply)
      + ip_protocol                  = "udp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 4789
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.control_plane_internal will be created
  + resource "aws_vpc_security_group_ingress_rule" "control_plane_internal" {
      + arn                          = (known after apply)
      + description                  = "Control-plane internal communication"
      + id                           = (known after apply)
      + ip_protocol                  = "-1"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.etcd_client will be created
  + resource "aws_vpc_security_group_ingress_rule" "etcd_client" {
      + arn                          = (known after apply)
      + description                  = "etcd client communication"
      + from_port                    = 2379
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 2379
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.etcd_peer will be created
  + resource "aws_vpc_security_group_ingress_rule" "etcd_peer" {
      + arn                          = (known after apply)
      + description                  = "etcd peer communication"
      + from_port                    = 2380
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 2380
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.kubelet will be created
  + resource "aws_vpc_security_group_ingress_rule" "kubelet" {
      + arn                          = (known after apply)
      + description                  = "Kubelet communication from workers"
      + from_port                    = 10250
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 10250
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.kubelet_from_control_plane will be created
  + resource "aws_vpc_security_group_ingress_rule" "kubelet_from_control_plane" {
      + arn                          = (known after apply)
      + description                  = "Kubelet communication from control plane"
      + from_port                    = 10250
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 10250
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.nlb_api will be created
  + resource "aws_vpc_security_group_ingress_rule" "nlb_api" {
      + arn                    = (known after apply)
      + cidr_ipv4              = "10.30.0.0/16"
      + description            = "Kubernetes API access from VPC"
      + from_port              = 6443
      + id                     = (known after apply)
      + ip_protocol            = "tcp"
      + region                 = "us-east-1"
      + security_group_id      = (known after apply)
      + security_group_rule_id = (known after apply)
      + tags_all               = {}
      + to_port                = 6443
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.worker_from_control_plane will be created
  + resource "aws_vpc_security_group_ingress_rule" "worker_from_control_plane" {
      + arn                          = (known after apply)
      + description                  = "Kubelet communication from control-plane nodes"
      + from_port                    = 10250
      + id                           = (known after apply)
      + ip_protocol                  = "tcp"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
      + to_port                      = 10250
    }

  # module.security_groups.aws_vpc_security_group_ingress_rule.worker_internal will be created
  + resource "aws_vpc_security_group_ingress_rule" "worker_internal" {
      + arn                          = (known after apply)
      + description                  = "Worker internal communication"
      + id                           = (known after apply)
      + ip_protocol                  = "-1"
      + referenced_security_group_id = (known after apply)
      + region                       = "us-east-1"
      + security_group_id            = (known after apply)
      + security_group_rule_id       = (known after apply)
      + tags_all                     = {}
    }

Plan: 60 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + kubernetes_api_endpoint = (known after apply)

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
PS C:\Users\Srinivasa Reddy B\Desktop\Github\self-managed-kubernetes-aws\Environments\prod>

What the 60 resources will create
Component	Resources / configuration
VPC	1 VPC (10.30.0.0/16)
Subnets	3 public + 3 private
Internet Gateway	1
NAT Gateways	3, one per AZ
Route tables	1 public + 3 private
EC2	3 control planes + 3 workers
Security groups	Control plane, worker, NLB
IAM	EC2 role, instance profile, SSM policy
Internal NLB	1, with TCP 6443 listener
Target group	1, with 3 control-plane targets

The three-AZ layout and separate private route tables are consistent with the architecture we designed.

