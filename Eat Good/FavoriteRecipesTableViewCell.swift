//
//  FavoriteRecipesTableViewCell.swift
//  Eat Good
//
//  Created by Leith Reardon on 7/20/18.
//  Copyright © 2018 Malik Arachiche. All rights reserved.
//

import UIKit

class FavoriteRecipesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var favoriteRecipeImage: UIImageView!
    @IBOutlet weak var favoriteRecipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
