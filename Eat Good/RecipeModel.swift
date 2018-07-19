//
//  RecipeModel.swift
//  Eat Good
//
//  Created by Leith Reardon on 7/19/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RecipeModel {
    let title: String
    let image: String
    let link: String
    let ingredients: String
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        self.image = json["thumbnail"].stringValue
        self.link = json["href"].stringValue
        self.ingredients = json["ingredients"].stringValue
    }
}
