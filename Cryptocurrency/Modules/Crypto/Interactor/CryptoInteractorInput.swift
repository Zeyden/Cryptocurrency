//
//  CryptoInteractorInput.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


protocol CryptoInteractorInput: class {
    func obtainCryptocurrencies(start: Int, limit: Int, converted: CryptocurrencyNetwork.ConverterCurrencies?)
}
