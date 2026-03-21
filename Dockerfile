# Using Eclipse Temurin (the successor to the old openjdk image)
FROM eclipse-temurin:17-jre-focal

# Your GitHub metadata link
LABEL org.opencontainers.image.source="https://github.com/LauroBeck/docker-images"
LABEL org.opencontainers.image.description="Financial system for market volatility analysis"

# Optional: Add your jar and start command
# COPY target/finance.jar /app/finance.jar
# CMD ["java", "-jar", "/app/finance.jar"]
