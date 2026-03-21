# MSSQL Enterprise Service Schema

This document tracks the table structures for the Microsoft SQL Server instance (ghcr.io/laurobeck/mssql-server).

##  Core Tables

### 1. USER_ACCOUNTS
Centralized authentication and role management for the financial platform.
- USER_ID (INT PRIMARY KEY)
- USERNAME (NVARCHAR 50)
- ROLE_TYPE (NVARCHAR 20) -- e.g., ARCHITECT, ANALYST
- LAST_LOGIN (DATETIME2)

### 2. SERVICE_CONFIG
Configuration parameters for the Java 17 and GraphQL gateway layers.
- CONFIG_KEY (NVARCHAR 100)
- CONFIG_VALUE (NVARCHAR(MAX))
- ENVIRONMENT (NVARCHAR 10) -- e.g., PROD, STAGING
