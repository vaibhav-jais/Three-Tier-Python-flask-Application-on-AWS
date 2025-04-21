output "jenkins_public_ip" {
  value = module.ec2_jenkins.jenkins_public_ip
}

output "jenkins_public_dns" {
  value = module.ec2_jenkins.jenkins_public_dns
}
