//
//  CryptoRouter.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation
import UIKit


class CryptoRouter {
    
    weak var view: CryptoViewController?
    
    func pushToCryptoDetail(_ completion: ((CryptoDetailModuleInput) -> Void)) {
        let s = UIStoryboard(name: "CryptoDetail", bundle: nil)
        if let cryptoDetail = s.instantiateInitialViewController() as? CryptoDetailViewController {
            view?.navigationController?.pushViewController(cryptoDetail, animated: true)
            
            if let moduleInput = cryptoDetail.output as? CryptoDetailModuleInput {
                completion(moduleInput)
            }
        }
    }
    
}
