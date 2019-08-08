#https://www.terraform.io/docs/providers/aws/r/route53_record.html
resource "aws_route53_record" "jenkins33" {
  zone_id = "${var.zone_id}"
  name    = "jenkins33.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.jenkins33.public_ip}"]
}
