//
//  Recipe.swift
//  Eat Good
//
//  Created by Leith Reardon on 7/17/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Recipe {
    let title: String
    let ingredients: String
    let url: String
    let picture: String?
    
    init(json: JSON) {
        self.title = json["title"].stringValue
        self.ingredients = json["ingredients"].stringValue
        self.url = json["href"].stringValue
        self.picture = json["thumbnail"].stringValue
    }
}
