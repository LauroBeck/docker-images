# Enterprise Financial Data Dictionary

This document defines the business logic and calculation rules for the data stored in the ghcr.io/laurobeck/db2 and ghcr.io/laurobeck/mssql-server instances.

##  Market Intelligence Metrics

### 1. VOLATILITY_INDEX (DB2.MARKET_PRICES)
**Description:** A derived risk metric used to trigger automated "stress-test" alerts.
- **Formula:** Standard deviation of price changes over a rolling 20-period window.
- **Scale:** 0.00 to 1.00 (where > 0.85 indicates a High-Volatility Inflection).
- **Business Rule:** If the index exceeds 0.85, the Java 17 service must trigger a high-priority audit log in SYSTEM_LOGS.

### 2. PRICE_TIMESTAMP (DB2.MARKET_PRICES)
**Description:** High-precision record of market value.
- **Standard:** ISO 8601 (UTC).
- **Business Rule:** Must be captured at the moment the GraphQL API receives the push from the external market provider.

##  Infrastructure Metrics

### 1. ROLE_TYPE (MSSQL.USER_ACCOUNTS)
- **ARCHITECT:** Full access to schema modifications and stack orchestration.
- **ANALYST:** Read-only access to Market Intelligence dashboards.
