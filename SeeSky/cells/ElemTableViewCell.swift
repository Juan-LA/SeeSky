//
//  ElemTableViewCell.swift
//  SeeSky
//
//  Created by Juan Liut on 23/04/23.
//

import UIKit

class ElemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hStack: UIStackView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var btn: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
