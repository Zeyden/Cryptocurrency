//
//  CryptoInteractor.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


class CryptoInteractor {
    
    weak var output: CryptoInteractorOutput?
    
}


extension CryptoInteractor: CryptoInteractorInput {
    
    func obtainCryptocurrencies(start: Int, limit: Int, converted: CryptocurrencyNetwork.ConverterCurrencies?) {
        CryptocurrencyNetwork.shared.obtainCryptocurrenciesList(start: start, limit: limit, converted: converted) { [weak self] (currencies, error) in
            if let currencies = currencies {
                let sortedByRankCurrencies = currencies.sorted(by: { Int($0.rank ?? "0") ?? 0 < Int($1.rank ?? "0") ?? 0 })
                self?.output?.didObtainCryptocurrencies(sortedByRankCurrencies, for: start, with: limit)
            } else if let error = error {
                //There must be handlers here, but not this time.
                //...
                self?.output?.didObtainCryptocurrenciesWithError()
            }
        }
    }
    
    
    private func checkForInternetConnection(code: Int) {
        
    }
    
}
