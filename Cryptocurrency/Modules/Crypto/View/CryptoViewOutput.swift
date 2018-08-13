//
//  CryptoViewOutput.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 28.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


protocol CryptoViewOutput: class {
    func viewIsReady()
    func didBeginViewUpdating()
    func viewNeedsMoreData(_ oldData: [Currency]?)
    func didSelectCurrency(_ currency: Currency)
}
