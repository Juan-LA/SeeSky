//
//  FavoritesViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 20/04/23.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var textNoAva: UILabel!
    @IBOutlet weak var tableFavorite: UITableView!
    
    var fav = getListFav2()
    
    var noElem : Bool = false
    
    var selectedCelestial = defaultCelestial
    
    var nameOfCelestial: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///For Tab Bar background
        self.tabBarController?.tabBar.backgroundImage = UIImage(named: "wallpaper")
        self.tabBarController?.tabBar.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        
        fav = getListFav2().sorted()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = "Favorites"
        
        if noElem {
            tableFavorite.isHidden = true
            textNoAva.isHidden = false
            
            textNoAva.text = "No favorites elements..."
            
        } else {
            tableFavorite.isHidden = false
            textNoAva.isHidden = true
            
            tableFavorite.delegate = self
            tableFavorite.dataSource = self
            
            tableFavorite.reloadData()
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fav = getListFav2().sorted()
        noElem = fav.isEmpty
        if noElem {
            tableFavorite.isHidden = true
            textNoAva.isHidden = false
            
            textNoAva.text = "No favorites elements..."
            
        } else {
            tableFavorite.isHidden = false
            textNoAva.isHidden = true
            
            tableFavorite.delegate = self
            tableFavorite.dataSource = self
            
            tableFavorite.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fav = getListFav2().sorted()
        noElem = fav.isEmpty
        if noElem {
            tableFavorite.isHidden = true
            textNoAva.isHidden = false
            
            textNoAva.text = "No favorites elements..."
            
        } else {
            tableFavorite.isHidden = false
            textNoAva.isHidden = true
            
            tableFavorite.delegate = self
            tableFavorite.dataSource = self
            
            tableFavorite.reloadData()
        }
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
        
//        if let name = nameOfCelestial {
//            celestial = getCelestial(celestials, nameOfCelestial!)
        cell.celestial = getCelestial(celestials, fav[indexPath.row])
        
        if searchIfIsFav(fav[indexPath.row]) {
            cell.btn.setImage(UIImage(systemName: "star.fill")?.withTintColor(.white), for: .normal)
        }
        else {
            cell.btn.setImage(UIImage(systemName: "star")?.withTintColor(.white), for: .normal)
        }
        
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
