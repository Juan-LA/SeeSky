//
//  CategoriesTableViewCell.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 28/03/23.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var img: UIImageView!
    
    
    @IBOutlet weak var name: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
