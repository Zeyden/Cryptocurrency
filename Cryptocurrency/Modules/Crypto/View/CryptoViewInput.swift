//
//  CryptoViewInput.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


protocol CryptoViewInput: class {
    func setupInitialState()
    func beginRefreshing()
    func endRefreshing()
    func beginLoading()
    func endLoading()
    func showNumberOfCurrencies()
    func hideNumberOfCurrencies()
    func displayCurrenciesData(_ newData: [Currency])
    func displayCurrenciesDataByAppending(_ newData: [Currency])
}
