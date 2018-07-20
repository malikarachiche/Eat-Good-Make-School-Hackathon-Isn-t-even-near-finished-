//
//  SearchIngridientsViewController.swift
//  Eat Good
//
//  Created by Malik Arachiche on 7/18/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class SearchIngridientsViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
  
    let cellId = "cellIdentifier"
    
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var getCookingButton: UIButton!
    @IBOutlet weak var homeTableView: UITableView!
    
    //var placeholder: String?
    var chosenIngredients = [String]()
    var testData: [String] = []
    
    
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        homeTableView.delegate = self
        homeTableView.isHidden = true
        homeTableView.dataSource = self
       
        guard let jsonURL = Bundle.main.url(forResource: "ingredientsList", withExtension: "json") else {
            print("Could not find ingredientsList.json!")
            return
        }
        let jsonData = try! Data(contentsOf: jsonURL)
        let userData = try! JSON(data: jsonData)
        
        for i in 0...(userData.count - 1) {
            testData.append(userData[i].stringValue)
        }
        
        filteredData = testData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        cell.textLabel?.text = testData[indexPath.row]
//        cell.textLabel?.text = performSearch(words: [testData[indexPath.row]], term: <#T##String#>)
//        let filteredData  = data.filter { $0.contains(_ other: searchBar.text) }
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        filteredData = searchText.isEmpty ? testData : testData.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        homeTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        homeTableView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenIngredients.append(filteredData[indexPath.row])
        print(chosenIngredients)
        
        searchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        homeTableView.isHidden = true
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        homeTableView.isHidden = false
        searchBar.text = ""
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

    
    @IBAction func getCookingButtonAction(_ sender: UIButton) {
        print("Cooking button works")
    }
    
    
    
}

