# Formbricks on AWS (EC2 + Docker Compose)

This project deploys Formbricks using Docker Compose on an EC2 VM with Nginx as reverse proxy, ECR as image registry, and automated backups to S3.

## Requirements
- Docker + Docker Compose on EC2
- AWS CLI on EC2
- GitHub repository for CI/CD

## Quick start (local)
1. Copy .env.example to .env and fill secrets.
   - Update Formbricks-specific variables using the official docs.
2. Build and run:
   - docker compose up -d --build
3. Open http://localhost in a browser.

## Deploy on EC2
1. Create an EC2 Ubuntu 22.04 VM.
2. Install Docker and AWS CLI.
3. Copy this repo to /opt/formbricks on the VM.
4. Create .env on the VM from .env.example.
5. Start the stack:
   - docker compose up -d --build

## Scale to 2 instances
- docker compose up -d --scale app=2

## CI/CD (GitHub Actions)
Required repository secrets:
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION
- ECR_REPOSITORY
- EC2_HOST
- EC2_USER
- EC2_SSH_KEY

## Backup to S3
1. Create S3 bucket.
2. Update S3_BACKUP_BUCKET and S3_BACKUP_PREFIX in .env.
3. Run backup script:
   - sh scripts/backup_to_s3.sh
4. Add cron job for daily backup.

## Observability
- Use docker logs for app and db containers.
- Healthchecks are configured in docker-compose.yml.

## Security
- Secrets are stored in .env (do not commit).
- If possible, run containers as non-root.
- Add WAF later using AWS WAF or ModSecurity.

## HTTPS (bonus)
- Use a free domain like DuckDNS.
- Add TLS to Nginx with Certbot.
