//
//  SearchResultsViewController.swift
//  Eat Good
//
//  Created by Leith Reardon on 7/18/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class SearchResultsViewController: UIViewController {
    
    var apiRecipePuppy = "http://www.recipepuppy.com/api/"
    let ingredients = ["milk", "eggs", "black pepper"]
    var recipeList: [RecipeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recipeUrl = processUrl(ingredients: ingredients)
        
        Alamofire.request(recipeUrl).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    if json["results"].count == 10 {
                        for i in 0...9 {
                            let newRecipe = RecipeModel(json: json["results"][i])
                            self.recipeList.append(newRecipe)
                        }
                    }
                }
                print("success")
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // 1
//        return recipeList.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! RecipeTableViewCell
//
//        let recipe = recipeList[indexPath.row]
//        cell.previewText.text = recipe.title
//        cell.noteTitleLabel.text = recipe.ingredients
//        cell.noteModificationTimeLabel.text = recipe.image
//
//        return cell
//    }
    
    func processUrl(ingredients: [String]) -> String{
        var apiRecipePuppy = "http://www.recipepuppy.com/api/"
        var urlAddition = "?i="
        
        for i in ingredients {
            var editedIngredientName = i.trimmingCharacters(in: .whitespaces)
            if editedIngredientName.contains(" ") {
                editedIngredientName = editedIngredientName.replacingOccurrences(of: " ", with: "+")
            }
            editedIngredientName.append("%2C+")
            urlAddition.append(editedIngredientName)
        }
        
        urlAddition.append("&q=")
        apiRecipePuppy.append(urlAddition)
        
        return apiRecipePuppy
    }
}
