#!/usr/bin/env sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: restore_from_s3.sh <s3_key>"
  exit 1
fi

S3_KEY="$1"
TMP_FILE="/tmp/formbricks_restore.sql.gz"

aws s3 cp "s3://${S3_BACKUP_BUCKET}/${S3_BACKUP_PREFIX}/${S3_KEY}" "${TMP_FILE}"

gunzip -c "${TMP_FILE}" | docker compose exec -T db psql -U "${POSTGRES_USER}" "${POSTGRES_DB}"
