package com.laurobeck.finance.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.stream.Collectors;

/**
 * High-Performance Market Ingest Service
 * Designed for Java 17 Service Layer
 */
public class MarketIngestService {

    // Record for immutable, memory-efficient market data
    public record MarketAsset(String symbol, double price, String volatility, String timestamp) {}

    public List<MarketAsset> processBackup(String csvPath) throws IOException {
        Path path = Path.of(csvPath);
        
        return Files.lines(path)
                .map(line -> line.split(","))
                .filter(parts -> parts.length >= 4)
                .map(parts -> new MarketAsset(
                        parts[0].replace("\"", ""), // Symbol
                        Double.parseDouble(parts[1]), // Price
                        parts[2].replace("\"", ""), // Volatility
                        parts[3].replace("\"", "")  // Timestamp
                ))
                .collect(Collectors.toList());
    }

    public void logStressAlerts(List<MarketAsset> assets) {
        assets.stream()
              .filter(a -> a.volatility().contains("High"))
              .forEach(a -> System.out.printf("[CRITICAL] High Volatility Detected: %s at $%.2f%n", 
                                a.symbol(), a.price()));
    }
}
