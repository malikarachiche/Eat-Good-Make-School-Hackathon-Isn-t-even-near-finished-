//
//  ViewController.swift
//  Eat Good
//
//  Created by Malik Arachiche on 7/16/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cookingButton: UIButton!
    @IBOutlet weak var addButtonoutlet: UIButton!
    
    
    var testData = ["Malik", "Aktar", "Leith", "Ekow", "Owais", "Tushar", "Nathan"]
    
    var filteredData = [String]()
    
    var isSearching = false
    //filteredData  = data.filter { $0.contains(_ other: searchBar.text) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func searchBar(_ searchBar: UISearchBar, textDidChange searchText:String){
        filterContentForSearchText(searchText: searchText)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        if searchText != "" {
            
            filteredData = testData.filter {name in
                
                return   name.lowercased().contains(searchText.lowercased())
                
            }
        }else { self.filteredData = self.data}
    }
 */
    @IBAction func cookingButtonAction(_ sender: UIButton) {
    }
    @IBAction func addButton(_ sender: UIButton) {
        
    }
    
}

