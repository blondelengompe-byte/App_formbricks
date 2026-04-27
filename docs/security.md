# Security notes

- Store secrets in .env and never commit it.
- Use IAM roles on EC2 for S3 access if possible.
- Consider non-root containers when supported by the image.
- Add WAF for extra protection (AWS WAF or ModSecurity).
