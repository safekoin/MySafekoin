//
//  Safekoin.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/4/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Trade: Decodable{
    
   
    let currency: String
    let price: String
    
    //JSON Initializer
    init(currency: String, price: String) {
        
        self.currency = currency
        self.price = price
        
    }
}

