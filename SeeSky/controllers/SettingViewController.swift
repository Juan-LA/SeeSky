//
//  SettingViewController.swift
//  SeeSky
//
//  Created by Juan Liut on 26/04/23.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    var credit : [String : String] = [ "NASA" : "for images" , "Le Systeme Solaire\nby Cristophe" : "for celestial bodies' data", "Valmirt (Sketchfab)" : "for the 3D model of the Solar System" , "Wikipedia" : "for the images and the celestial bodies' data", "The Solar System Fandom" : "for the images" ]
    var names : [String] = ["NASA", "Le Systeme Solaire\nby Cristophe", "Valmirt (Sketchfab)", "Wikipedia", "The Solar System Fandom" ]
    
    @IBOutlet weak var table: UITableView!
    
    
    
    @IBOutlet weak var credits: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Credits"
        
        
        
        
//        self.credits.text = "NASA : for images\n**Le Systeme Solaire by Cristophe** : for celestial bodies' data\n**Valmirt** (Sketchfab) : for the 3D model of the Solar System\n**Wikipedia** : for the images and the celestial bodies' data\n**The Solar System Fandom** : for the images\n "
        // Do any additional setup after loading the view.
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return credit.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "credit", for: indexPath) as! CreditsTableViewCell
        
        
        
        cell.name.text = names[indexPath.row]
        cell.creditFor.text = credit[names[indexPath.row]]
        
        return cell
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
