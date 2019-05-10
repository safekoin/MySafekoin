//
//  DetailViewController.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/10/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var currencyLabel: UILabel!
   
    @IBOutlet weak var priceLabel: UILabel!
    
    var currency: String!
    var price: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        currencyLabel.text = currency
        priceLabel.text = price
        
    }
    

    

}
