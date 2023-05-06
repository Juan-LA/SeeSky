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
    
    var descAndImage : DescAndImage = DescAndImage(englishName: "", url: "", desc: "")
    
    @IBOutlet weak var scrollVW: UIScrollView!
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
        
        scrollVW.isScrollEnabled = true
        
        ///Update var Info
        info.append(selectedCelestial.bodyType)
        info.append(String(selectedCelestial.equaRadius))
        info.append(String(selectedCelestial.gravity))
        info.append(String(selectedCelestial.aphelion))
        
        ///Update var DescAndImage
        descAndImage = getDescAndImage(englishName: selectedCelestial.englishName)
        
        ///Background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        
        ///Is OTD?
//        OTDLbl.textColor = .systemIndigo
//        OTDLbl.isHidden = true
        
        ///Celestial's name
//        celestialLbl.textColor = .white
//        celestialLbl.text = selectedCelestial.name
        
        print("Body type: \(selectedCelestial.bodyType)")
        
        ///Celestial Image
        let url = descAndImage.url
        
        if url == " " {
                celestialImg.image = UIImage(named: selectedCelestial.bodyType)
            } else {
                celestialImg.kf.setImage(with: URL(string: url))
            }
        
        
//        celestialImg.layer.cornerRadius = 16
        
        ///Info
        infoColl.dataSource = self
        infoColl.delegate = self
    
        
        
        
        ///Description section
        desc.textColor = .white
        desc.text = descAndImage.desc
        print("DESC: \(descAndImage.desc)")
        
        
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
            
            if selectedCelestial.englishName == "Sun"{
                info.removeLast()
                return info.count
            } else {
                return info.count
            }
            
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
            switch indexPath.row{
            case 0:
                cell.dataLbl.text = "\(info[indexPath.row])"
                break
            default:
                cell.dataLbl.text = "\(info[indexPath.row]) km"
                break
            }
            
            cell.dataLbl.textColor = .white
            
            ///Info
            cell.nameLbl.text = listInfo[indexPath.row]
            cell.nameLbl.textColor = .white
            
            ///Divider
            if indexPath.row == info.count - 1 {
                cell.divider.isHidden = true
            }
            
            
            
            
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
