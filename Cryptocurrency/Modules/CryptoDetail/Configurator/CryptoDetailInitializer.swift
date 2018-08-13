//
//  CryptoDetailInitializer.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 01.05.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


class CryptoDetailInitializer: NSObject {
    @IBOutlet weak var cryptoDetailViewController: CryptoDetailViewController!
    
    override func awakeFromNib() {
        let configurator = CryptoDetailConfigurator()
        configurator.configueModuleForViewInput(cryptoDetailViewController)
    }
    
}
