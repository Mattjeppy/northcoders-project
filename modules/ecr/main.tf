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
