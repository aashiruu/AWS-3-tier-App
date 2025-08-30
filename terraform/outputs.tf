output "web_server_public_ip" {
  description = "The public IP address of the Web Tier EC2 instance"
  value       = aws_eip.web_eip.public_ip
}

output "app_server_private_ip" {
  description = "The private IP address of the App Tier EC2 instance"
  value       = aws_instance.app_tier.private_ip
}

output "s3_bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.app_bucket.bucket
}

output "s3_bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.app_bucket.arn
}

# Command to SSH into the Web Tier (Bastion) and then into the App Tier
output "ssh_command_through_bastion" {
  description = "SSH command to access the private app server via the public web server"
  value       = "ssh -J ubuntu@${aws_eip.web_eip.public_ip} ubuntu@${aws_instance.app_tier.private_ip}"
}
