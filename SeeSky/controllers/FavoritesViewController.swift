//
//  FavoritesViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 20/04/23.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableFavorite: UITableView!
    
    var fav = getListFav()
    
    var selectedCelestial = defaultCelestial
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Favorites"
        
        
        tableFavorite.delegate = self
        tableFavorite.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableFavorite.dequeueReusableCell(withIdentifier: "cellFav") as! ElemTableViewCell
        
        ///Content
        cell.backgroundColor = .clear
        ///Hstack
        cell.hStack.layer.cornerRadius = 16
        cell.hStack.layer.borderWidth = 2
        cell.hStack.layer.borderColor = CGColor(gray: 1, alpha: 0.3)
        cell.hStack.backgroundColor = UIColor(cgColor: CGColor(red: 8/255, green: 11/255, blue: 23/255, alpha: 1))
        
        cell.name.text = "\t\(fav[indexPath.row])"
        //fav[indexPath.row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "elem" {
            guard let celVC = segue.destination as? CelestialViewController else {return}
            
            celVC.selectedCelestial = selectedCelestial
            celVC.navigationItem.title = "\(selectedCelestial.englishName)"
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCelestial = getCelestial(celestials, fav[indexPath.row])
        
        performSegue(withIdentifier: "elem", sender: nil)
        
    }
    

}
