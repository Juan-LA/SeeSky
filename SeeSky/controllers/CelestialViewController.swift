//
//  PlanetOfTheDayViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 26/03/23.
//

import UIKit
import Kingfisher

class CelestialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var selectedCelestial : Celestial = defaultCelestial
    
    var info : [String] = []
    var listInfo: [String] = ["Type", "Radius", "Gravity", "Distance from Sun"]
    
    @IBOutlet weak var OTDLbl: UILabel!
    ///Name of the celestial
    @IBOutlet weak var celestialLbl: UILabel!
    ///Image of the celestial
    @IBOutlet weak var celestialImg: UIImageView!
    ///Info Collection
    
    @IBOutlet weak var infoColl: UICollectionView!
    
    ///Description
    @IBOutlet weak var desc: UITextView!
    ///Curiosity
    @IBOutlet weak var curiositiesTxt: UITextView!
    ///Collection with celestials nearby
    @IBOutlet weak var celestialNearby: UICollectionView!
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        ///Update var Info
        info.append(selectedCelestial.bodyType)
        info.append(String(selectedCelestial.equaRadius))
        info.append(String(selectedCelestial.gravity))
        info.append(String(selectedCelestial.aphelion))
        
        ///Background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        
        ///Is OTD?
//        OTDLbl.textColor = .systemIndigo
//        OTDLbl.isHidden = true
        
        ///Celestial's name
//        celestialLbl.textColor = .white
//        celestialLbl.text = selectedCelestial.name
        
        ///Celestial Image
        celestialImg.kf.setImage(with: URL(string: getImage(englishName: selectedCelestial.englishName)))
        celestialImg.layer.cornerRadius = 32
        
        ///Info
        infoColl.dataSource = self
        infoColl.delegate = self
        
        
        
        ///Description section
        desc.textColor = .white
//        desc.text = selectedCelestial.desc
        
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
//        celestialLbl.text = selectedCelestial.name
//        celestialImg.image = planetOfDay.image
//        desc.text = selectedCelestial.desc
//        details.text = planetOfDay.technical
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.celestialNearby{
            return 5
        } else {
            return info.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.celestialNearby{
            let cell = celestialNearby.dequeueReusableCell(withReuseIdentifier: "nearby", for: indexPath) as! OTDCell
            
            cell.img.image = UIImage(systemName: "house.fill")
            cell.name.text = "Prova"
            cell.name.textColor = .white
            
            return cell
            
        } else {
            
            let cell = infoColl.dequeueReusableCell(withReuseIdentifier: "info", for: indexPath) as! InfoCollectionViewCell
            
            ///Background
            cell.backgroundColor = .clear
            ///Data shown
            cell.dataLbl.text = info[indexPath.row]
            cell.dataLbl.textColor = .white
            
            ///Info
            cell.nameLbl.text = listInfo[indexPath.row]
            cell.nameLbl.textColor = .white
            
            ///Divider
//            cell.divider.layer.cornerRadius = 16
//            cell.divider.backgroundColor = UIColor(white: 1, alpha: 0.5)
            
            
            
            
            
            return cell
            
        }
        
       
    }
    
    ///To make navigation item appear in other views
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
