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
import TwitterKit

import Firebase


class HomeViewController: UIViewController,TWTRComposerViewControllerDelegate {
    
    
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var twitterButton: TWTRLogInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.get()
        setupTwitterButton()
    }
    
    func goToHome() {
        let navVC = storyboard?.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        
        present(navVC,animated: true, completion: nil)
      
    }
    
    func goToLogin() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        present(homeVC,animated: true, completion: nil)
        
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
    
    
    func setupTwitterButton() {
        
        
        twitterButton.logInCompletion = { (session, err) in
            if let error = err {
                print("Twitter Login Error: \(String(describing: error.localizedDescription))")
                return
            }
            guard let token = session?.authToken else {return}
            guard let secret = session?.authTokenSecret else {return}
            
            let credential = TwitterAuthProvider.credential(withToken: token, secret: secret)
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if error != nil {
                    print("Failed to Login using Firebase: \(String(describing:error?.localizedDescription))")
                    return
                    
                }
                if let auth = authResult {
                    
                    print("Successfully Authenticated User to Firebase: \(auth.user.uid)")
                    
                    self.goToHome()
                }
            }
        }
        
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
