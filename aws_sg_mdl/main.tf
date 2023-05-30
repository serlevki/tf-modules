resource "aws_security_group" "main" {
   name   = "${var.env}-${var.sg_name}" 
   vpc_id = var.vpc_id

   dynamic "ingress" {
       for_each = var.ingress_rules

       content {
           
           from_port   = ingress.value
           to_port     = ingress.value  
           protocol    = "tcp"
           cidr_blocks = ["0.0.0.0/0"]
       }
   }
   dynamic "egress" {
       for_each = var.egress_rules

       content {
           description = egress.value
           from_port   = egress.value 
           to_port     = egress.value     
           protocol    = "tcp"
           cidr_blocks = ["0.0.0.0/0"]
       }
   }
}