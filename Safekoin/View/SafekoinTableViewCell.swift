//
//  SafekoinTableViewCell.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/8/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import UIKit

class SafekoinTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    static let identifier = "Cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func searchConfigure(with trades: Trade) {
        
        currencyLabel.text = trades.currency
        priceLabel.text = trades.price
        
}
}
