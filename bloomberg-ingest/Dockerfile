FROM python:3.11-slim

# Install DB2 dependencies
RUN apt-get update && apt-get install -y libxml2-dev gcc g++

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ingest_bloomberg.py .

# Entry point to start the ingestion loop
CMD ["python", "ingest_bloomberg.py"]
