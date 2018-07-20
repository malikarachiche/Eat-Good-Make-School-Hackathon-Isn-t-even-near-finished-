//
//  CoreDataHelper.swift
//  Eat Good
//
//  Created by Leith Reardon on 7/18/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError()}
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newRecipe() -> Recipe {
        let recipe = NSEntityDescription.insertNewObject(forEntityName: "Recipe", into: context) as! Recipe
        return recipe
    }
    
    static func saveRecipe() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func deleteRecipe(recipe: Recipe) {
        context.delete(recipe)
        saveRecipe()
    }
    
    static func retrieveRecipes() -> [Recipe] {
        do {
            let fetchRequest = NSFetchRequest<Recipe>(entityName: "Recipe")
            
            let results = try context.fetch(fetchRequest)
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            return []
        }
    }
}
