# EC2 deployment steps

1. Create an EC2 Ubuntu 22.04 VM.
2. Install Docker and Docker Compose.
3. Install AWS CLI.
4. Clone this repo to /opt/formbricks.
5. Copy .env.example to .env and fill secrets.
6. Run:
   - docker compose up -d --build
7. Verify at http://<EC2_PUBLIC_IP>.
