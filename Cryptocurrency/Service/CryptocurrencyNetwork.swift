//
//  CryptocurrencyNetwork.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 29.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


class CryptocurrencyNetwork {
    enum ConverterCurrencies: String {
        static var allValues = ["AUD", "BRL", "CAD", "CHF", "CLP", "CNY", "CZK", "DKK", "EUR", "GBP", "HKD", "HUF", "IDR", "ILS", "INR", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP", "PKR", "PLN", "RUB", "SEK", "SGD", "THB", "TRY", "TWD", "ZAR"]
        
        case AUD = "AUD"
        case BRL = "BRL"
        case CAD = "CAD"
        case CHF = "CHF"
        case CLP = "CLP"
        case CNY = "CNY"
        case CZK = "CZK"
        case DKK = "DKK"
        case EUR = "EUR"
        case GBP = "GBP"
        case HKD = "HKD"
        case HUF = "HUF"
        case IDR = "IDR"
        case ILS = "ILS"
        case INR = "INR"
        case JPY = "JPY"
        case KRW = "KRW"
        case MXN = "MXN"
        case MYR = "MYR"
        case NOK = "NOK"
        case NZD = "NZD"
        case PHP = "PHP"
        case PKR = "PKR"
        case PLN = "PLN"
        case RUB = "RUB"
        case SEK = "SEK"
        case SGD = "SGD"
        case THB = "THB"
        case TRY = "TRY"
        case TWD = "TWD"
        case ZAR = "ZAR"
    }
    
    
    private(set) static var shared = CryptocurrencyNetwork()
    private(set) var baseURL = "https://api.coinmarketcap.com/v1"
    
    func obtainCryptocurrenciesList(start: Int = 0, limit: Int = 20, converted: ConverterCurrencies? = nil, _ completion: @escaping (([Currency]?, ServiceError?) -> Void)) {
        let session = URLSession.shared
        
        var endPoint = "/ticker/?start=\(start)&limit=\(limit)"
        if let converted = converted {
            endPoint += "&convert=\(converted.rawValue)"
        }
        
        let urlString = baseURL + endPoint
        
        guard let url = URL(string: urlString) else { return }
        
        let datatask = session.dataTask(with: url) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            let serviceError = ServiceError(error: error as NSError?, responseCode: statusCode)
            
            var entities: [Currency]?
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
                let array = json as? [Any]  {
                
                entities = array.compactMap { Currency(json: $0) }
            }
            
            DispatchQueue.main.async {
                completion(entities, serviceError)
            }
        }
        
        datatask.resume()
    }
    
    
    func obtainCryptocurrency(id: String, converted: ConverterCurrencies? = nil, _ completion: @escaping ((Currency?, ServiceError?) -> Void)) {
        let session = URLSession.shared
        
        let endPoint = "/ticker/\(id)/"
        
        let urlString = baseURL + endPoint
        
        guard let url = URL(string: urlString) else { return }
        
        let datatask = session.dataTask(with: url) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            let serviceError = ServiceError(error: error as NSError?, responseCode: statusCode)
            
            var entity: Currency?
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                
                entity = Currency(json: json)
            }
            
            DispatchQueue.main.async {
                completion(entity, serviceError)
            }
        }
        
        datatask.resume()
    }
    
}










