//
//  SafekoinService.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/4/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import Foundation
typealias TradeHandler = ([Trade])-> Void
final class SafekoinService {
    
    static let shared = SafekoinService()
    private init() {}
    
    func getTrades(completion: @escaping TradeHandler ) {
        
        guard let url = URL(string: NomicsAPI.nomicsURL())else {
            completion([])
            print("Bad Trade URL")
            return
        }
        var trades = [Trade]()
        
        URLSession.shared.dataTask(with: url) { (dat,_ ,_ ) in
            
            if let data = dat {
                do {
                    let jsonObject =  try JSONDecoder().decode([Trade].self, from:data)
                    
                    for t in jsonObject{
                        trades.append(t)
                    }
                    completion(trades)
                    
                }catch{
                    completion([])
                    print("decoding failed: \(error.localizedDescription)")
                    return
                }
            }
        }.resume()
        
    }
}
