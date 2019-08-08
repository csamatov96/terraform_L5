output "link" {
  value = "http://${aws_route53_record.jenkins.name}:8080"
}
