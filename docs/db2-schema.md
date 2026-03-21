# DB2 Enterprise Financial Schema

This document tracks the actual table structures exported from the IBM DB2 instance (ghcr.io/laurobeck/db2).

##  Core Tables (Financial Intelligence)

### 1. MARKET_PRICES
Used for high-frequency tracking of S&P 500, Nasdaq, and tech sector volatility.
- **TICKER** (VARCHAR 10): Primary identifier for assets (e.g., IBM, NVDA, ORCL).
- **PRICE_TIMESTAMP** (TIMESTAMP): High-precision record of price inflection.
- **OPEN_PRICE** (DECIMAL 18,4): Opening market value.
- **CLOSE_PRICE** (DECIMAL 18,4): Closing market value.
- **VOLATILITY_INDEX** (FLOAT): Calculated risk metric for market stress-testing.

### 2. SYSTEM_LOGS
Audit trail for the High-Performance Java 17 and GraphQL API services.
- **LOG_ID** (BIGINT): Unique identifier for audit entries.
- **SERVICE_NAME** (VARCHAR 50): Identifies the source (e.g., system-java17, graphql).
- **PAYLOAD** (BLOB): Stores the raw request/response data for troubleshooting.

---
*Last Exported: 2026-03-20 22:04*
