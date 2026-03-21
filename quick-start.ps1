# Enterprise Financial Stack Quick-Start
# Optimized for high-volume pulls (DB2, MSSQL, Java 17)

Write-Host "Initializing Enterprise Architecture Environment..." -ForegroundColor Cyan

# 1. Pre-pulling heavy images in parallel to save time
Write-Host "Step 1: Pre-pulling heavy images (approx. 7GB total)..." -ForegroundColor Yellow
 = @(
    "ghcr.io/laurobeck/db2:latest",
    "ghcr.io/laurobeck/mssql-server:2022",
    "ghcr.io/laurobeck/system-java17:1.0",
    "ghcr.io/laurobeck/graphql:1.0",
    "ghcr.io/laurobeck/finance:1.0"
)

foreach ($img in $images) {
    Write-Host "Pulling $img..."
    Start-Process docker -ArgumentList "pull $img" -NoNewWindow -Wait
}

# 2. Launch the Orchestrator
Write-Host "
Step 2: Launching Orchestration via Docker Compose..." -ForegroundColor Yellow
docker-compose up -d

# 3. Final Verification
Write-Host "
Step 3: Verifying Service Connectivity..." -ForegroundColor Yellow
Start-Sleep -Seconds 10
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

Write-Host "
Environment Ready! Access the GraphQL API on port 8080." -ForegroundColor Green
Write-Host "Use './monitor-stack.ps1' to track real-time performance." -ForegroundColor Gray
