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
| ghcr.io/laurobeck/docker-images/db2-finance:2026-03-20 | 4.27GB | Data | **Verified 03/20 Market State (12 Assets)** |
| ghcr.io/laurobeck/mssql-server:2022 | 2.23GB | Data | Microsoft SQL Auth & Config |
| ghcr.io/laurobeck/system-java17:1.0 | 1.21GB | Logic | High-Performance Java 17 Engine |
| ghcr.io/laurobeck/graphql:1.0 | 1.20GB | API | Unified GraphQL Gateway |

## ?? Rapid Deployment (IaC)
`powershell
# 1. Pull and Start the High-Fidelity 03/20/26 Market Image
docker pull ghcr.io/laurobeck/docker-images/db2-finance:2026-03-20
docker run -d --name db2-fin --privileged=true -p 50000:50000 ghcr.io/laurobeck/docker-images/db2-finance:2026-03-20

# 2. Verify Market Stress Signals (Nasdaq/MSFT)
docker exec -it db2-fin bash -l -c "db2 'connect to FIN_DB; select * from MARKET_STRESS_WATCH; terminate;'"
??? Maintenance & Operations
Monitoring: Run ./monitor-stack.ps1 for real-time telemetry.

Backups: Run ./backup-stack.ps1 to export schemas to docs/backups/.

Maintainer: Lauro Sergio Vasconcellos Beck | Enterprise Architect

?? Recent Updates
[2026-03-20] Successfully committed 12-asset global snapshot to GHCR.

[2026-03-20] Configured MARKET_STRESS_WATCH to capture Nasdaq drops > 2.0%.
