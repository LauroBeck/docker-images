# Enterprise Stack: Daily Operations Master Script
# Automates: Start -> Ingest -> Report -> Health Check

Write-Host "--- Starting Daily Financial Stack Operations ---" -ForegroundColor Cyan

# Step 1: Initialize Docker Stack
Write-Host "Step 1: Initializing Docker Containers..." -ForegroundColor Yellow
docker-compose up -d
Write-Host "Waiting 15 seconds for DB2 and MSSQL to stabilize..."
Start-Sleep -Seconds 15 

# Step 2: Ingest Bloomberg Data (MSFT & Nasdaq Snapshot)
Write-Host "Step 2: Ingesting Market Data into DB2..." -ForegroundColor Yellow
docker exec bloomberg-ingest python ingest_bloomberg.py

# Step 3: Generate PDF Volatility Report
Write-Host "Step 3: Generating Daily PDF Summary in docs/reports/..." -ForegroundColor Yellow
docker exec bloomberg-ingest python generate_report.py

# Step 4: Final System Health Check
Write-Host "Step 4: Launching System Telemetry Dashboard..." -ForegroundColor Yellow
./monitor-stack.ps1
