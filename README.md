# ?? Enterprise Financial Docker Stack
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white)
![IBM DB2](https://img.shields.io/badge/IBM%20DB2-052FAD?style=for-the-badge&logo=ibm&logoColor=white)
![MSSQL](https://img.shields.io/badge/MSSQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)

High-performance containerized ecosystem designed for market intelligence, volatility modeling, and real-time financial data orchestration.

---

## ??? System Architecture
* **Data Layer:** High-volume storage using **IBM DB2** (4.27GB) and **MSSQL** (2.23GB).
* **Service Layer:** High-performance **Java 17** and **Java 11** microservices.
* **API Gateway:** **GraphQL** layer for unified data access and market inflection monitoring.

## ?? Image Inventory
| Registry Image | Size | Tier | Primary Purpose |
| :--- | :--- | :--- | :--- |
| `ghcr.io/laurobeck/docker-images/db2-finance:2026-03-20` | 4.27GB | Data | **Verified 03/20 Market State (12 Assets)** |
| `ghcr.io/laurobeck/mssql-server:2022` | 2.23GB | Data | Microsoft SQL Auth & Config |
| `ghcr.io/laurobeck/system-java17:1.0` | 1.21GB | Logic | High-Performance Java 17 Engine |
| `ghcr.io/laurobeck/graphql:1.0` | 1.20GB | API | Unified GraphQL Gateway |

## ?? Rapid Deployment (IaC)
```powershell
# 1. Pull and Start the High-Fidelity 03/20/26 Market Image
docker pull ghcr.io/laurobeck/docker-images/db2-finance:2026-03-20
docker run -d --name db2-fin --privileged=true -p 50000:50000 ghcr.io/laurobeck/docker-images/db2-finance:2026-03-20

# 2. Verify Market Stress Signals (Nasdaq/MSFT)
docker exec -it db2-fin bash -l -c "db2 'connect to FIN_DB; select * from MARKET_STRESS_WATCH; terminate;'"
??? Maintenance & OperationsMonitoring: Run ./monitor-stack.ps1 for real-time telemetry.Backups: Run ./backup-stack.ps1 to export schemas to docs/backups/.?? Bloomberg Ingest Audit (2026-03-21)Verified Data State: The following records were successfully ingested and exported via backup-stack.ps1.?? Market Stress Watch (Sample Output)Asset SymbolPrice (USD)VolatilityLast Sync (UTC)StatusNQ (Nasdaq 100)18,245.50?? High2026-03-21 02:53IngestedES (S&P 500)5,117.25?? Med2026-03-21 02:53IngestedCL (Crude Oil)81.40?? Stable2026-03-21 02:53IngestedGC (Gold)2,165.10?? Stable2026-03-21 02:53Ingested[!TIP]Audit Success: 12 total asset records verified. Full dataset available in docs/backups/20260321_0253/.?? Verification EvidenceAbove: Successful DB2 connection and 12-row export confirmation.Maintainer: Lauro Sergio Vasconcellos Beck | Enterprise Architect?? Recent Updates[2026-03-21] Finalized backup-stack.ps1 with verified CSV export logic.[2026-03-20] Successfully committed 12-asset global snapshot to GHCR.[2026-03-20] Configured MARKET_STRESS_WATCH to capture Nasdaq drops > 2.0%.'@
