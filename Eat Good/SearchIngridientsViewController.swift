//
//  SearchIngridientsViewController.swift
//  Eat Good
//
//  Created by Malik Arachiche on 7/18/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import UIKit

class SearchIngridientsViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
  
    let cellId = "cellIdentifier"
    
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var getCookingButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    //var placeholder: String?
    
    var testData = ["Malik", "Aktar", "Leith", "Ekow", "Owais", "Tushar", "Nathan"]
    
    var filteredData: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        homeTableView.delegate = self
        homeTableView.isHidden = true
        homeTableView.dataSource = self
       

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "erik"
        
        return cell
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        homeTableView.isHidden = true
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        homeTableView.isHidden = false
    }
    
    func performSearch(words: [String], term: String) -> [String] {
        var results: [String] = []
        for word in words {
            if word.range(of: term) != nil {
                results.append(word)
            }
        }
        return results
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let results = performSearch(words: testData, term: searchText)
        print (results)
    }
    
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        print("Add button works")
    }
    
    @IBAction func getCookingButtonAction(_ sender: UIButton) {
        print("Cooking button works")
    }
    
    
    
}

