//
//  LoginViewController.swift
//  Safekoin
//
//  Created by Nwabueze Chukwunyere on 5/4/19.
//  Copyright © 2019 Nwabueze Chukwunyere. All rights reserved.
//

import UIKit
import Firebase

class SafekoinViewController: UIViewController {
    
    
    @IBOutlet weak var SafekoinTableView: UITableView!
    
    var searchController = UISearchController(searchResultsController: nil)
    let viewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSearchBar()
        viewModel.get()
        viewModel.delegate = self
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        searchController.isActive = false
    }
    deinit {
        print("Search View Controller has deallocated")
    }
    
    func createSearchBar() {
        searchController.searchBar.placeholder = "Search Currency"
        searchController.definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    
    }
    
    @IBAction func signoutTapped(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        
        do {
            
            try firebaseAuth.signOut()
            
        } catch {
            
            print ("Error signing out: \(error.localizedDescription)")
        }
        
        goToLogin()
    }
    
    func goToLogin() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        present(homeVC,animated: true, completion: nil)
        
    }
    
}

extension SafekoinViewController: ViewModelDelegate {
    
    func updateView() {
        
        DispatchQueue.main.async {
            self.SafekoinTableView.reloadData()
            print("Search View Reloaded")
        }
    }
}
extension SafekoinViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        viewModel.filterTrades(with: searchText)
  }
    
}
extension SafekoinViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.myTrades.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SafekoinTableViewCell.identifier, for: indexPath) as! SafekoinTableViewCell
        
        let trade = viewModel.myTrades[indexPath.row]

        cell.searchConfigure(with: trade)
        
        return cell
    }
}

extension SafekoinViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 187
        
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let trade = viewModel.myTrades[indexPath.row]
        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailVC.currency = trade.currency
        detailVC.price = trade.price
        
        self.navigationController?.pushViewController(detailVC, animated: true)
      
}

}
