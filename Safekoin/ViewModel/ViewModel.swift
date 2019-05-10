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
    
    // backing storage for all possible trades
    private var allTrades = [Trade]()

    // the trades that are actually visible
    var myTrades = [Trade]() {
        didSet {
            delegate?.updateView()
        }
    }
   
    func get() {
        
        SafekoinService.shared.getTrades() { [unowned self] myTrades in
            self.allTrades = myTrades
            self.myTrades = myTrades
            print("Trades Count: \(self.myTrades.count)")
        }
    }
    
    func filterTrades(with search: String) {
        guard search.isEmpty == false else {
            myTrades = allTrades
            return
        }
        
        print("Size before filtering is: \(myTrades.count)")
        myTrades = allTrades.filter({$0.currency.lowercased().contains(search.lowercased()) || $0.price.lowercased().contains(search.lowercased())})
        
        print("Size after filtering is: \(myTrades.count)")
    }
    
}
