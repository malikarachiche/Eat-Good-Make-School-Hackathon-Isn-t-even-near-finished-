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
    var favoriteRecipesList = CoreDataHelper.retrieveRecipes()
    
    
    
    @IBOutlet var recipeTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return favoriteRecipesList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteRecipeCell", for: indexPath) as! FavoriteRecipesTableViewCell

            let recipe = favoriteRecipesList[indexPath.row]
            cell.favoriteRecipeTitle.text = recipe.title
        
            if recipe.image != "" {
                cell.favoriteRecipeImage.af_setImage(withURL: URL(string: recipe.image!)!)
            }

            return cell
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteRecipesList = CoreDataHelper.retrieveRecipes()
        recipeTableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let recipeToDelete = favoriteRecipesList[indexPath.row]
            CoreDataHelper.deleteRecipe(recipe: recipeToDelete)
            favoriteRecipesList = CoreDataHelper.retrieveRecipes()
            recipeTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if favoriteRecipesList[indexPath.row].link != "" {
            UIApplication.shared.openURL(URL(string: favoriteRecipesList[indexPath.row].link!)!)
        }
    }
}
