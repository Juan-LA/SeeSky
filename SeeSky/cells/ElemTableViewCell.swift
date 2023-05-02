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
    
    
    var nameOfCelestial: String?
    var celestial: Celestial?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func btnFavPressed(_ sender: UIButton) {
        print("sono qui!!!!!!")
        guard let celestial = celestial else {
            return
            }
        print("BUTTON FAV PRESSED: ", celestial.englishName)
        print(searchIfItFav(celestial.englishName))
        
        if !searchIfItFav(celestial.englishName) {
            btn.setImage(UIImage(systemName: "star.fill")?.withTintColor(.white), for: .normal)
            addToFav(celestial.englishName)
        }
        else {
            btn.setImage(UIImage(systemName: "star")?.withTintColor(.white), for: .normal)
            removeTheFavStar(celestial.englishName)
        }
        
        /*
         
         if searchIfItFav(elemCategory[indexPath.row].englishName) {
             cell.btn.setImage(UIImage(systemName: "star.fill")?.withTintColor(.white), for: .normal)
         }
         else {
             cell.btn.setImage(UIImage(systemName: "star")?.withTintColor(.white), for: .normal)
         }
         
         
         */
        
        
        
        
        
    }
    
    @IBAction func btnFavPressedforFav(_ sender: UIButton) {
        print("sono qui!!!!!!")
        guard let celestial = celestial else {
            return
            }
        print("BUTTON FAV PRESSED: ", celestial.englishName)
        print(searchIfItFav(celestial.englishName))
        
        if !searchIfItFav(celestial.englishName) {
            btn.setImage(UIImage(systemName: "star.fill")?.withTintColor(.white), for: .normal)
            addToFav(celestial.englishName)
        }
        else {
            btn.setImage(UIImage(systemName: "star")?.withTintColor(.white), for: .normal)
            removeTheFavStar(celestial.englishName)
        }
        
        /*
         
         if searchIfItFav(elemCategory[indexPath.row].englishName) {
             cell.btn.setImage(UIImage(systemName: "star.fill")?.withTintColor(.white), for: .normal)
         }
         else {
             cell.btn.setImage(UIImage(systemName: "star")?.withTintColor(.white), for: .normal)
         }
         
         
         */
        
        
        
        
        
    }
    
    
}
