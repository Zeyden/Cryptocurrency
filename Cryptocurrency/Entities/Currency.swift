//
//  Currency.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


struct Currency {
    let id: String
    var name: String?
    var symbol: String?
    var rank: String?
    var priceUsd: String?
    var priceBtc: String?
    var volumeUsd24h: String?
    var marketCapUsd: String?
    var availableSupply: String?
    var totalSupply: String?
    var maxSupply: String?
    var percentChange1h: String?
    var percentChange24h: String?
    var percentChange7d: String?
    var lastUpdate: String?
    
    init?(json: Any) {
        guard let json = json as? [String: Any] else { return nil }
        
        let nonnullDict = json.filter { ($0.value as? String) != nil }
        
        guard let filteredDict = nonnullDict as? [String: String] else { return nil }
        
        guard let id = filteredDict["id"] else { return nil }
        
        self.id = id
        self.name = filteredDict["name"]
        self.symbol = filteredDict["symbol"]
        self.rank = filteredDict["rank"]
        self.priceUsd = filteredDict["price_usd"]
        self.priceBtc = filteredDict["price_btc"]
        self.volumeUsd24h = filteredDict["24h_volume_usd"]
        self.marketCapUsd = filteredDict["market_cap_usd"]
        self.availableSupply = filteredDict["available_supply"]
        self.totalSupply = filteredDict["total_supply"]
        self.maxSupply = filteredDict["max_supply"]
        self.percentChange1h = filteredDict["percent_change_1h"]
        self.percentChange24h = filteredDict["percent_change_24h"]
        self.percentChange7d = filteredDict["percent_change_7d"]
        self.lastUpdate = filteredDict["last_updated"]
    }
}

/*
 "last_updated": "1524923975",
 "price_rub": "582286.507168",
 "24h_volume_rub": "488109400588.0000610352",
 "market_cap_rub": "9900842826256"
 */
