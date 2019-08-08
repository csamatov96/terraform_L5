output "link" {
  value = "http://${aws_route53_record.example.name}:8443"
}
