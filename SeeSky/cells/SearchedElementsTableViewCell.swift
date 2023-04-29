//
//  SearchedElementsTableViewCell.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 27/04/23.
//

import UIKit

class SearchedElementsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var elemLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
