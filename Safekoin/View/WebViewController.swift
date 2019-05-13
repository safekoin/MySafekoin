//
//  WebViewController.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/12/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var loadingView: UIView!
  
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var webView = WKWebView()
    
    
    override func loadView() {
        super.loadView()
        
        self.view = webView
        
        self.webView.addSubview(loadingView)
        self.webView.bringSubviewToFront(loadingView)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        
        loadingView.layer.cornerRadius = loadingView.layer.frame.size.height / 2
        
        webView.navigationDelegate = self
        
        let url = URL(string:"https://gemini.com")!
        
        let request = URLRequest(url: url)
        
        webView.load(request)
        
    }
    
    
   
    
} //end class

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.isHidden = true
        
    }
    
}

