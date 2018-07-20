//
//  FavoritesViewController.swift
//  Eat Good
//
//  Created by Malik Arachiche on 7/18/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var apiRecipePuppy = "http://www.recipepuppy.com/api/"
    let ingredients = ["milk", "eggs", "black pepper"]
    var favoritesRecipeList: [Recipe] = [] {
        didSet {
            recipeTableView.reloadData()
        }
    }
    
    @IBOutlet var recipeTableView: UITableView!
    
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return favoritesRecipeList.count
        }

        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

            let recipe = favoritesRecipeList[indexPath.row]
            cell.textLabel?.text = recipe.title
//            cell.noteTitleLabel.text = recipe.ingredients
//            cell.noteModificationTimeLabel.text = recipe.image

            return cell
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoritesRecipeList = CoreDataHelper.retrieveRecipes()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let recipeToDelete = favoritesRecipeList[indexPath.row]
            CoreDataHelper.deleteRecipe(recipe: recipeToDelete)
            favoritesRecipeList = CoreDataHelper.retrieveRecipes()
        }
    }
}
