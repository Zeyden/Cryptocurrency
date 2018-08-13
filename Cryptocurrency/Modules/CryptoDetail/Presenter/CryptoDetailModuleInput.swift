//
//  CryptoDetailModuleInput.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 01.05.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


protocol CryptoDetailModuleInput: class {
    func setupData(_ currency: Currency)
}
