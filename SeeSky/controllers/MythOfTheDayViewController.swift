//
//  MythOfTheDayViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 27/03/23.
//

import UIKit

class MythOfTheDayViewController: UIViewController {

    
    
    @IBOutlet weak var mythLbl: UILabel! //this is the name of the myth
    
    
    @IBOutlet weak var mythImage: UIImageView! //this is for the image of the myth
    
    
    @IBOutlet weak var desc: UITextView!
    
    
    @IBOutlet weak var details: UITextView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.08626819402, green: 0.0862794593, blue: 0.2283709049, alpha: 1)
        
        mythLbl.textColor = .white
        desc.textColor = .white
        desc.backgroundColor = #colorLiteral(red: 0.08626819402, green: 0.0862794593, blue: 0.2283709049, alpha: 1)
        details.textColor = .white
        desc.backgroundColor = #colorLiteral(red: 0.08626819402, green: 0.0862794593, blue: 0.2283709049, alpha: 1)
        details.backgroundColor = #colorLiteral(red: 0.08626819402, green: 0.0862794593, blue: 0.2283709049, alpha: 1)
        
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        mythLbl.text = mythOfDay.name
        mythImage.image = mythOfDay.image
        desc.text = mythOfDay.description
        details.text = mythOfDay.technical
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
