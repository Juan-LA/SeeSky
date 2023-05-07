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
    var nextCelestial : Celestial = defaultCelestial
    
    var info : [String] = []
    var listInfo: [String] = ["Type", "Radius", "Gravity", "Distance from Sun"]
    
    var descAndImage : DescAndImage = DescAndImage(englishName: "", url: "", desc: "")
    
    var nearbyElem : [Celestial] = []
    var nearbyImg : [DescAndImage] = []
    
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
        

        
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        scrollVW.isScrollEnabled = true
//        let navigation = UINavigationBar.appearance()
//
//        let navigationFont = UIFont(name: "Figtree-Black", size: 20)
//        let navigationLargeFont = UIFont(name: "Futura", size: 34) //34 is Large Title size by default
//
//        navigation.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: navigationFont!]
//
//        if #available(iOS 11, *){
//            navigation.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: navigationLargeFont!]
//        }
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
        print(url)
        
        if url == " " {
                celestialImg.image = UIImage(named: selectedCelestial.bodyType)
            } else {
                celestialImg.kf.setImage(with: URL(string: url))
            }
        
        
//        celestialImg.layer.cornerRadius = 16
        
        ///Info
        infoColl.dataSource = self
        infoColl.delegate = self
        infoColl.reloadData()
        
        
        
        ///Description section
        desc.textColor = .white
        desc.adjustUITextViewHeight(arg: self.desc)
        desc.text = descAndImage.desc
        print("DESC: \(descAndImage.desc)")
        
        ///Nearby Section
        celestialNearby.dataSource = self
        celestialNearby.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.celestialNearby{
            nearbyElem = get3ElemRandom(celestials)
            for elem in nearbyElem {
                nearbyImg.append(getDescAndImage(englishName: elem.englishName))
            }
            return nearbyElem.count
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
        
        if collectionView == celestialNearby{
            let cell = celestialNearby.dequeueReusableCell(withReuseIdentifier: "nearby", for: indexPath) as! OTDCell
            
            let url = nearbyImg[indexPath.row].url
            
            if url == " " {
//                var cat = getImgCat()
                var position : Int = 0
                for i in 0..<categories.count {
                    if categories[i] == selectedCelestial.bodyType{
                        position = i
                        break
                    }
                }
//                print("CAT: \(categories[position])")
                print(categories[position])
                cell.img.image = UIImage(named: "\(categories[position])")
                
//                cell.img.kf.setImage(with: URL(string: cat[position]))
                } else {
                    cell.img.kf.setImage(with: URL(string: url))
                }
            cell.name.text = nearbyElem[indexPath.row].englishName
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if (segue.identifier == "next"){
//
//            guard let celVC = segue.destination as? CelestialViewController else {return}
//
//            celVC.selectedCelestial = selectedCelestial
//            celVC.navigationItem.title = "\(selectedCelestial.englishName)"
//
//
//            }
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == celestialNearby{
            
            ///Update the entire view with the new info
            selectedCelestial = nearbyElem[indexPath.row]
            self.navigationItem.title = selectedCelestial.englishName
            updateUI()
            self.viewDidLoad()
        }
    }

}
