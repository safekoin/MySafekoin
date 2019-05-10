//
//  GeminiAPI.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/4/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import Foundation

struct NomicsAPI {
    
    static let base = "https://api.nomics.com/v1/prices?key="
    static let key = "56a64ae72f702049fcc06ffb9d052aa7"
    
    static func nomicsURL()-> String {
        return base + key
    }
}
