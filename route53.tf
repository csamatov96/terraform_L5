#https://www.terraform.io/docs/providers/aws/r/route53_record.html
resource "aws_route53_record" "jenkins" {
  zone_id = "${var.zone_id}"
  name    = "jenkins.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.jenkins.public_ip}"]
}
