//
//  FavTableViewCell.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 20/04/23.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var favoriteStar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
