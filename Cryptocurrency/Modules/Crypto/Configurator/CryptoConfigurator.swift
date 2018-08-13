//
//  CryptoConfigurator.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation
import UIKit


class CryptoConfigurator {
    
    func configueModuleForViewInput(_ viewInput: UIViewController) {
        if let crypto = viewInput as? CryptoViewController {
            configueCryptoModule(view: crypto)
        }
    }
    
    
    private func configueCryptoModule(view: CryptoViewController) {
        let presenter = CryptoPresenter()
        let interactor = CryptoInteractor()
        let router = CryptoRouter()
        
        view.output = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.view = view
    }
    
}
