//
//  CryptoDetailViewInput.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 01.05.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


protocol CryptoDetailViewInput: class {
    func setupInitialState()
    func displayCurrencyData(_ newData: Currency)
}
