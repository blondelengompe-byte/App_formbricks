# Security notes

- Store secrets in .env and never commit it.
- Use IAM roles on EC2 for S3 access if possible.
- Consider non-root containers when supported by the image.
- WAF enabled with ModSecurity (OWASP CRS) in the Nginx container.
- Nginx runs as root for port 80 binding and ModSecurity runtime needs.
