import ibm_db
import time
import json
from datetime import datetime

# Connection string for your 4.27GB DB2 instance
dsn = "DATABASE=finance_db;HOSTNAME=db2;PORT=50000;PROTOCOL=TCPIP;UID=db2inst1;PWD=password;"

def ingest_market_data(ticker, price, change_pct):
    try:
        conn = ibm_db.connect(dsn, "", "")
        sql = "INSERT INTO MARKET_PRICES (TICKER, PRICE_TIMESTAMP, CLOSE_PRICE, VOLATILITY_INDEX) VALUES (?, ?, ?, ?)"
        stmt = ibm_db.prepare(conn, sql)
        
        # Mapping Bloomberg data to your schema
        # Using change_pct as a proxy for the volatility index in this model
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        ibm_db.execute(stmt, (ticker, timestamp, price, abs(float(change_pct))))
        print(f"Successfully ingested {ticker} at {price}")
        ibm_db.close(conn)
    except Exception as e:
        print(f"Error ingesting data: {e}")

if __name__ == "__main__":
    # Real-time data from your March 20, 2026 Bloomberg screenshots
    market_snapshot = [
        {"ticker": "MSFT", "price": 381.87, "change": -1.84},
        {"ticker": "NDX", "price": 21647.61, "change": -2.01},
        {"ticker": "SPX", "price": 6506.48, "change": -1.51}
    ]
    
    for data in market_snapshot:
        ingest_market_data(data['ticker'], data['price'], data['change'])
