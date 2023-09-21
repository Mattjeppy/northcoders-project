resource "aws_ecr_repository" "frontend" {
  name = var.frontend_repository
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "backend" {
  name = var.backend_repository
  image_scanning_configuration {
    scan_on_push = true
  }
}

output "frontend_url" {
  value = aws_ecr_repository.frontend.repository_url
}
output "backend_url" {
  value = aws_ecr_repository.backend.repository_url
}