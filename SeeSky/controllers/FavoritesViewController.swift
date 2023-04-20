//
//  FavoritesViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 20/04/23.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var tableFavorite: UITableView!
    
    var fav = getFavorites(favorites)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = "Favorites"
        
        tableFavorite.delegate = self
        tableFavorite.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fav.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableFavorite.dequeueReusableCell(withIdentifier: "cell") as! FavTableViewCell
        
        cell.name.text = fav[indexPath.row].name
        
        return cell
    }
    
    

}
