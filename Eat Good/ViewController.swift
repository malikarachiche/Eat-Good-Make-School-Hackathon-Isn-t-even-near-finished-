//
//  ViewController.swift
//  Eat Good
//
//  Created by Malik Arachiche on 7/16/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import UIKit 
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cookingButton: UIButton!
    
    
    var testData = ["Malik", "Aktar", "Leith", "Ekow", "Owais", "Tushar", "Nathan"]
    
    var filteredData = [String]()
    
    var isSearching = false
    
    
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
    
    
    func processUrl(ingredients: [String]) -> String{
        var apiRecipePuppy = "http://www.recipepuppy.com/api/"
        var urlAddition = "?i="
        
        for i in ingredients {
            var editedIngredientName = ""
            if i.contains(" ") {
                editedIngredientName = i.replacingOccurrences(of: " ", with: "+")
            } else {
                editedIngredientName = i
            }
            editedIngredientName.append("%2C+")
            urlAddition.append(editedIngredientName)
        }
        
        urlAddition.append("&q=")
        apiRecipePuppy.append(urlAddition)
        
        return apiRecipePuppy
    }

    @IBAction func cookingButtonAction(_ sender: UIButton) {
    }
    
}

