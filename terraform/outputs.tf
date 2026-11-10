output "vpc_id" {
  value = aws_vpc.k8s_vpc.id
}

output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.public :
    key => subnet.id
  }
}

output "control_plane_api_endpoint" {
  value = "${aws_eip.control_plane.public_ip}:6443"
}

output "nodes" {
  value = {
    for name, instance in aws_instance.nodes :
    name => {
      instance_id = instance.id
      private_ip  = instance.private_ip

      public_ip = name == "control-plane" ? (
        aws_eip.control_plane.public_ip
      ) : instance.public_ip
    }
  }
}