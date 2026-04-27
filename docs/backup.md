# Automated backups to S3

1. Create an S3 bucket for backups.
2. Update .env variables:
   - S3_BACKUP_BUCKET
   - S3_BACKUP_PREFIX
   - AWS_REGION
3. Run backup script:
   - sh scripts/backup_to_s3.sh
4. Add a cron job:
   - 0 2 * * * /opt/formbricks/scripts/backup_to_s3.sh
