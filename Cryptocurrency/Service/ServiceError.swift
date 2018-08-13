//
//  ServiceError.swift
//  Cryptocurrency
//
//  Created by Азат Шамсуллин on 29.04.2018.
//  Copyright © 2018 ZeydenApp. All rights reserved.
//

import Foundation


struct ServiceError {
    var error: NSError?
    var responseCode: Int?
    
    init?(error: NSError?, responseCode: Int?) {
        if error == nil, responseCode == nil {
            return nil
        }
        
        self.error = error
        self.responseCode = responseCode
    }
}
