# StocksAPI

This is a library that leverages Yahoo Finance REST API and provides very simple and Swiftly way to interact with it.

## Features

- Fetch Chart data for 1d, 1w, 1mo, 3mo, 6mo, 1y, 2y, 5y, YTD, max.
- Search Ticker using query.
- Fetch quotes using ticker symbols.
- Swift Async Await Interface.
- Fetch Raw JSON data.

## Usecase

### Initialize repository

First of all, you need to import and initalize the `StocksAPI`.

```swift
import StocksAPI

let api = StocksAPI()
```

### Fetch TSLA stocks last 1 week
```swift
let tesla1wkChart = try await api.fetchChartData(tickerSymbol: "TSLA", range: .oneWeek)
```

### Search Tickers using "TESLA" as Query
```swift
let tickers = try await api.searchTickers(query: "TESLA")
```

### Fetch Quote Detail for multiple symbols TSLA, GOOG, AAPL, MSFT
```swift
let quotes = try await api.fetchQuotes(symbols: "TSLA,GOOG,AAPL,MSFT")
```

###  This is entirely Powered by Yahoo Finance API
https://www.yahoo.com/?ilc=401

### Yahoo Finance REST API Postman Collection Download Link:
https://drive.google.com/file/d/1GzLBLGSE4nRjjj-bI0nSV0Un5VGiKO5j/view


## Installation

### Swift Package Manager
Here is how you proceed to add it to your project:

- File > Swift Packages > Add Package Dependency
- Add https://github.com/Learnin-IOS/StocksAPI.git
- Select "Main" branch

