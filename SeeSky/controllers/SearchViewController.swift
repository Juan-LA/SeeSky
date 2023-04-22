//
//  SearchViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 28/03/23.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titlePage: UILabel!
    
    @IBOutlet weak var OTDSectionTitle: UILabel!
    
    @IBOutlet weak var CategoriesSectTitle: UILabel!
    
    @IBOutlet weak var sectionOTD: UICollectionView!
    
    @IBOutlet weak var sectionCategories: UITableView!
    
    ///Data
    var constellations : [Celestial] = getListType("constellation")
    var planets : [Celestial] = getListType("planet")
    var asteroids : [Celestial] = getListType("asteroid")
    var stars : [Celestial] = getListType("star")
    var galaxies : [Celestial] = getListType("galaxy")
    var nebulas : [Celestial] = getListType("nebula")
    
    ///Elements OTD section
    var elemOTD : [Celestial] = getOTD()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionOTD.delegate = self
        sectionOTD.dataSource = self
        
        sectionCategories.delegate = self
        sectionCategories.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elemOTD.count
    }
    
    
    ///Function to create cell of collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        ///Cells for Section Of The Day
        let cell = sectionOTD.dequeueReusableCell(withReuseIdentifier: "cellOTD", for: indexPath) as! OTDCell
        
        print(cell)
//        
//        cell.name.text = sectionOTD[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sectionCategories.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        
        cell.name.text = categories[indexPath.row]
        cell.img.image = UIImage(systemName: "house.fill")
        
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
