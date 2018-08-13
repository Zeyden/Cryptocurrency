//
//  CryptoInteractorOutput.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


protocol CryptoInteractorOutput: class {
//    func didObtainCryptocurrency(_ cryptocurrency: Currency)
//    func didObtainCryptocurrencyWithError(_ error: Error)
    func didObtainCryptocurrencies(_ cryptocurrencies: [Currency], for start: Int, with limit: Int)
    func didObtainCryptocurrenciesWithError()
}
