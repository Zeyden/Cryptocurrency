//
//  CryptoPresenter.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


class CryptoPresenter {
    
    weak var view: CryptoViewInput?
    var interactor: CryptoInteractorInput?
    var router: CryptoRouter?
    
    weak var cryptoDetailModuleInput: CryptoDetailModuleInput?
    
    private var noDataForLoading: Bool = false
}


extension CryptoPresenter: CryptoViewOutput {
    
    func viewIsReady() {
        self.view?.setupInitialState()
    }
    
    
    func didBeginViewUpdating() {
        self.interactor?.obtainCryptocurrencies(start: 0, limit: 100, converted: nil)
    }
    
    
    func viewNeedsMoreData(_ oldData: [Currency]?) {
        let lastIndex = oldData?.count ?? 0
        
        if noDataForLoading == false {
            self.view?.beginLoading()
            self.interactor?.obtainCryptocurrencies(start: lastIndex, limit: 100, converted: nil)
        } else {
            self.view?.endRefreshing()
            self.view?.endLoading()
        }
    }
    
    
    func didSelectCurrency(_ currency: Currency) {
        self.router?.pushToCryptoDetail { [weak self] input in
            self?.cryptoDetailModuleInput = input
            input.setupData(currency)
        }
    }
    
}


extension CryptoPresenter: CryptoInteractorOutput {
   
    func didObtainCryptocurrencies(_ cryptocurrencies: [Currency], for start: Int, with limit: Int) {
        self.view?.endRefreshing()
        if start == 0 {
            self.view?.endRefreshing()
            self.view?.displayCurrenciesData(cryptocurrencies)
        } else {
            self.view?.endLoading()
            self.view?.displayCurrenciesDataByAppending(cryptocurrencies)
        }
    }
    
    
    func didObtainCryptocurrenciesWithError() {
        noDataForLoading = true
        self.view?.endRefreshing()
        self.view?.endLoading()
        self.view?.showNumberOfCurrencies()
    }
    
}













