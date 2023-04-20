//
//  SearchViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 28/03/23.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var sectionOTD: UICollectionView!
    
    @IBOutlet weak var sectionCategories: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionOTD.delegate = self
        sectionOTD.dataSource = self
        
        sectionCategories.delegate = self
        sectionCategories.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionOfTheDay.count
    }
    
    
    ///Function to create cell of collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        ///Cells for Section Of The Day
        if collectionView == self.sectionOTD {
            let cell = sectionOTD.dequeueReusableCell(withReuseIdentifier: "cellOTD", for: indexPath) as! OTDCell
            
            print(cell)
            
            cell.name.text = sectionOfTheDay[indexPath.row]
            
            return cell
        } else {
            ///Cells for Categories Section
           
            let cell = sectionOTD.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCell
                
            cell.name.text = sectionOfTheDay[indexPath.row]
            
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
}
