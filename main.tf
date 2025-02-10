resource "aws_instance" "staging_instance" {
    ami = data.aws_ami.ubuntu.id
    key_name = var.key_name
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.solar_system_sg.id]
    iam_instance_profile   = var.instance_profile
    user_data              = file("user_data.sh")

    tags = {
    Name        = "${var.project_name}-${var.environment}-instance"
    Environment = var.environment
    Project     = var.project_name
  }

}


resource "aws_security_group" "solar_system_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow SSH and HTTP inbound traffic"

  # Allow SSH access
  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow port 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP access
  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-sg"
    Environment = var.environment
    Project     = var.project_name
  }
}