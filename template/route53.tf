#https://www.terraform.io/docs/providers/aws/r/route53_record.html
resource "aws_route53_record" "example" {
  zone_id = "${var.zone_id}"
  name    = "r1soft.${var.domain}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.r1soft.public_ip}"]
}
