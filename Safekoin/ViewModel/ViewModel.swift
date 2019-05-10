//
//  ViewModel.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/4/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func updateView()
}

class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    
    var myTrades = [Trade]() {
        didSet {
            delegate?.updateView()
        }
}
    func get() {
        
        SafekoinService.shared.getTrades() { [unowned self] myTrades in
        
            self.myTrades = myTrades
            print("Trades Count: \(self.myTrades.count)")
        }
    }
    
}
