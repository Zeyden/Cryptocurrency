//
//  CryptoDetailConfigurator.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 01.05.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation
import UIKit


class CryptoDetailConfigurator {
    
    func configueModuleForViewInput(_ viewInput: UIViewController) {
        if let cryptoDetail = viewInput as? CryptoDetailViewController {
            configueCryptoDetailModule(view: cryptoDetail)
        }
    }
    
    
    private func configueCryptoDetailModule(view: CryptoDetailViewController) {
        let presenter = CryptoDetailPresenter()
//        let interactor = CryptoDetailInteractor()
        
        view.output = presenter
        
        presenter.view = view
//        presenter.interactor = interactor
        
//        interactor.output = presenter
    }
    
}
