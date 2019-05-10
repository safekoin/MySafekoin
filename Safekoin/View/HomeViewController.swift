//
//  HomeViewController.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/4/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI



class HomeViewController: UIViewController {
    let viewModel = ViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.get()
     
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            return
        }
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
    
    
    
    
}
extension HomeViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        guard error == nil else{
            return
       }
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
