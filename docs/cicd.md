# CI/CD with GitHub Actions

Pipeline steps:
1. Build image
2. Push to ECR
3. Deploy to EC2 using SSH

Required GitHub secrets:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION
- ECR_REPOSITORY
- EC2_HOST
- EC2_USER
- EC2_SSH_KEY
