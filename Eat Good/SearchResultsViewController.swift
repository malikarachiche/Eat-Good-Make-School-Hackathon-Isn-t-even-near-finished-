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

class SearchResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var apiRecipePuppy = "http://www.recipepuppy.com/api/"
    var ingredients = [String]()
    var recipeList: [RecipeModel] = []
    
    @IBOutlet var searchResultsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipeUrl = processUrl(ingredients: ingredients)

        
        Alamofire.request(recipeUrl).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    for i in 0...(json["results"].count) {
                        let newRecipe = RecipeModel(json: json["results"][i])
                        self.recipeList.append(newRecipe)
                    }
                    self.searchResultsTableView.reloadData()
                }
                print("success")
            case .failure(let error):
                print(error)
            
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "searchResultsSegue":
            let destination = segue.destination as! SearchIngridientsViewController
            destination.chosenIngredients = []
        default:
            print("unexpected segue identifier")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeList.count - 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsCell", for: indexPath) as! SearchIngridientsTableViewCell
        
        let recipe = recipeList[indexPath.row]
        cell.recipeTitle.text = recipe.title
        
        if recipe.image != "" {
            cell.recipeImage.af_setImage(withURL: URL(string: recipe.image)!)
        }
        
        return cell
    }
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if recipeList[indexPath.row].link != "" {
            UIApplication.shared.openURL(URL(string: recipeList[indexPath.row].link)!)
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let save = UITableViewRowAction(style: .normal, title: "Save") { (action, indexPath) in
            let recipeToSave = self.recipeList[indexPath.row]
            let newRecipe = CoreDataHelper.newRecipe()
            
            newRecipe.title = recipeToSave.title
            newRecipe.image = recipeToSave.image
            newRecipe.ingredients = recipeToSave.ingredients
            newRecipe.link = recipeToSave.link
            
            CoreDataHelper.saveRecipe()
        }
        
        save.backgroundColor = UIColor.green
        
        return [save]
    }
    
}
