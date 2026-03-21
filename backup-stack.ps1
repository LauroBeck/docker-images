# backup-stack.ps1 (Command File Method)
$timestamp = Get-Date -Format "yyyyMMdd_HHmm"
$backupDir = "docs/backups/$timestamp"

if (!(Test-Path $backupDir)) { New-Item -ItemType Directory -Path $backupDir -Force }

Write-Host "--- Starting DB2 Data Export: $timestamp ---" -ForegroundColor Cyan

# 1. Create a command file inside the container
$setupCmd = "echo 'connect to FIN_DB;' > /tmp/backup.sql && " +
            "echo 'export to /tmp/market_prices.csv of del select * from MARKET_PRICES;' >> /tmp/backup.sql && " +
            "echo 'export to /tmp/company_fundamentals.csv of del select * from COMPANY_FUNDAMENTALS;' >> /tmp/backup.sql && " +
            "echo 'terminate;' >> /tmp/backup.sql"

docker exec -u db2inst1 db2 bash -c "$setupCmd"

# 2. Execute the command file using DB2 CLP
docker exec -u db2inst1 db2 bash -l -c "db2 -tf /tmp/backup.sql"

# 3. Copy files to local backup directory
docker cp db2:/tmp/market_prices.csv "$backupDir/market_prices.csv"
docker cp db2:/tmp/company_fundamentals.csv "$backupDir/company_fundamentals.csv"

# 4. Cleanup container temp files
docker exec -u db2inst1 db2 rm /tmp/backup.sql /tmp/market_prices.csv /tmp/company_fundamentals.csv

Write-Host "Success: Backup stored in $backupDir" -ForegroundColor Green
