#!/usr/bin/env sh
set -eu

# Load env vars when running from cron or interactive shell
if [ -f /opt/formbricks/.env ]; then
	set -a
	. /opt/formbricks/.env
	set +a
fi

DATE_TAG=$(date -u +"%Y%m%dT%H%M%SZ")
BACKUP_DIR="/opt/formbricks/backups"
BACKUP_FILE="${BACKUP_DIR}/formbricks_${DATE_TAG}.sql.gz"

mkdir -p "${BACKUP_DIR}"

docker compose exec -T db pg_dump -U "${POSTGRES_USER}" "${POSTGRES_DB}" | gzip > "${BACKUP_FILE}"

aws s3 cp "${BACKUP_FILE}" "s3://${S3_BACKUP_BUCKET}/${S3_BACKUP_PREFIX}/"

# Optional cleanup: keep last 7 files
ls -1t "${BACKUP_DIR}"/formbricks_*.sql.gz | tail -n +8 | xargs -r rm -f
