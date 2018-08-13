//
//  CryptoInitializer.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


class CryptoInitializer: NSObject {
    
    @IBOutlet weak var cryptoViewController: CryptoViewController!
    
    override func awakeFromNib() {
        let configurator = CryptoConfigurator()
        configurator.configueModuleForViewInput(cryptoViewController)
    }
    
}
