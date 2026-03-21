Write-Host "Starting Integration Test Suite..." -ForegroundColor Cyan

# Start the test environment
docker-compose -f docker-compose.test.yml up -d test-db2

# Wait for DB2 to be ready (it's a 4.27GB image, so it needs a moment)
Write-Host "Waiting for DB2 to initialize..."
Start-Sleep -Seconds 30

# Run the Java 17 test container
docker-compose -f docker-compose.test.yml up test-runner

# Cleanup
Write-Host "Testing complete. Tearing down environment..."
docker-compose -f docker-compose.test.yml down -v
