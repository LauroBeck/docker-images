Write-Host "--- Real-Time System Telemetry ---" -ForegroundColor Cyan
docker stats db2 mssql-server bloomberg-ingest system-java17 graphql --no-stream
