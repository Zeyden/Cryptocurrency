//
//  CryptoDetailPresenter.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 01.05.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


class CryptoDetailPresenter {
    
    weak var view: CryptoDetailViewInput?
    
    private(set) var data: Currency?
    
}


extension CryptoDetailPresenter: CryptoDetailModuleInput {
    
    func setupData(_ currency: Currency) {
        self.data = currency
        self.view?.displayCurrencyData(currency)
    }
    
}


extension CryptoDetailPresenter: CryptoDetailViewOutput {
    func viewIsReady() {
        
    }
}
