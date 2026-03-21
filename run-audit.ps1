Write-Host "---  Starting Financial Stack Audit (DB2INST1) ---" -ForegroundColor Cyan
docker cp daily-audit.sql db2-fin:/tmp/daily-audit.sql
docker exec -u db2inst1 -it db2-fin bash -l -c "db2 -tf /tmp/daily-audit.sql"
Write-Host "---  Audit Complete ---" -ForegroundColor Green
