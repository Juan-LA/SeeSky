//
//  SearchViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 28/03/23.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var titlePage: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    
    
    @IBOutlet weak var OTDSectionTitle: UILabel!
    
    @IBOutlet weak var CategoriesSectTitle: UILabel!
    
    @IBOutlet weak var sectionOTD: UICollectionView!
    
    @IBOutlet weak var sectionCategories: UITableView!
    
//    ///Data
//    var constellations : [Celestial] = getListType("constellation")
//    var planets : [Celestial] = getListType("planet")
//    var asteroids : [Celestial] = getListType("asteroid")
//    var stars : [Celestial] = getListType("star")
//    var galaxies : [Celestial] = getListType("galaxy")
//    var nebulas : [Celestial] = getListType("nebula")
//    var satellites : [Celestial] = getListType("satellite")
//
    ///Elements OTD section
//    var elemOTD : [Celestial] = getOTD()
    
    var selectedCategory : String = ""
    var elemCat : [Celestial] = []
    var OTDElem : [Celestial] = []
    let imgUrls = getImgCat()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePage.textColor = .white
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        self.navigationController?.navigationBar.tintColor = .white
//        let appearance = UINavigationBarAppearance()
////                                appearance.configureWithOpaqueBackground()
//                                self.navigationController?.navigationBar.isTranslucent = false  // pass "true" for fixing iOS 15.0 black bg issue
//                      // We need to set tintcolor for iOS 15.0
//        appearance.shadowColor = .clear    //removing navigationbar 1 px bottom border.
//                                UINavigationBar.appearance().standardAppearance = appearance
//                                UINavigationBar.appearance().scrollEdgeAppearance = appearance
//                    
        
        ///SearchBar
        searchBar.backgroundColor = #colorLiteral(red: 0.03254487365, green: 0.04431659728, blue: 0.08980644494, alpha: 1)
        searchBar.placeholder = "Look for..."
        searchBar.isTranslucent = false
        searchBar.barTintColor = .clear
        searchBar.tintColor = .white
        
        ///OTD Section
        OTDSectionTitle.textColor = .white
        
        sectionOTD.delegate = self
        sectionOTD.dataSource = self
        
        sectionOTD.backgroundColor = .clear
        
        ///Categories Section
        CategoriesSectTitle.textColor = .white
        
        sectionCategories.delegate = self
        sectionCategories.dataSource = self
 
        sectionCategories.backgroundColor = .clear
        sectionCategories.tableFooterView = nil
        
        scroll.isScrollEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let totalHeight = OTDSectionTitle.frame.height + sectionOTD.frame.height + CategoriesSectTitle.frame.height + sectionCategories.contentSize.height
        
        scroll.contentSize = CGSize(width: view.frame.width, height: totalHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        OTDElem = get3ElemRandom(celestials)
        return OTDElem.count
    }
    
    
    ///Function to create cell of collection OTD
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        ///Cells for Section Of The Day
        let cell = sectionOTD.dequeueReusableCell(withReuseIdentifier: "OTDCell", for: indexPath) as! OTDCell
       
        cell.name.text = OTDElem[indexPath.row].englishName
        cell.name.textColor = .white
        
        cell.img.kf.setImage(with: URL(string: imgUrls[categories.firstIndex(of: OTDElem[indexPath.row].bodyType)!]))
        cell.img.layer.cornerRadius = 16
        
        
        cell.spaceForImg.backgroundColor = .clear
        cell.spaceForImg.layer.cornerRadius = 16
        
        cell.spaceForName.backgroundColor = .clear
        cell.spaceForName.layer.cornerRadius = 16
        
        ///HStack
        cell.hStack.layer.cornerRadius = 16
        cell.hStack.layer.borderColor = CGColor(gray: 1, alpha: 0.3)
        cell.hStack.layer.borderWidth = 2
        cell.hStack.layer.backgroundColor =  CGColor(red: 8/255, green: 11/255, blue: 23/255, alpha: 1)
       
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count + 1
    }
    
    ///Function to create cell of table Categories
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == categories.count{
            let cell = UITableViewCell()
            cell.backgroundColor = .clear
            
            return cell
        } else {
            
            let cell = sectionCategories.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            
//            var result = getBodies()
            
            
            ///Content
            ///Hstack
            cell.hStack.layer.cornerRadius = 16
            
            
            cell.hStack.backgroundColor = UIColor(cgColor: CGColor(red: 8/255, green: 11/255, blue: 23/255, alpha: 1))
            ///Text
            cell.name.text = "\t\(categories[indexPath.row])s"
            cell.hStack.layer.borderWidth = 2
            cell.hStack.layer.borderColor = CGColor(gray: 1, alpha: 0.3)
            cell.img.kf.setImage(with: URL(string: imgUrls[indexPath.row]))
            
            cell.name.textColor = .white
            
            ///View with image inside
            cell.spaceForImg.layer.cornerRadius = 16
            cell.spaceForImg.backgroundColor = .clear
            
            ///Img
            cell.img.layer.cornerRadius = 16
            cell.backgroundColor = .clear
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == categories.count{
            return 40
        } else {
            return 120 // altezza della cella
        }
        
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == categories.count{
            return nil
        } else {
            return indexPath
            
        }
    }
    
        
        
        
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "category"){
            
            guard let catVC = segue.destination as? CategoryViewController else {return}
            
            catVC.selectedCategory = selectedCategory
            
            catVC.elemCategory = elemCat
            
            catVC.navigationItem.title = "\(selectedCategory)s"
//            catVC.navigationItem.titleView?.tintColor = .white
//            catVC.navigationItem.titleView?.backgroundColor = .cyan
//            catVC.navigationItem.titleView?.backgroundColor =  UIColor(patternImage: UIImage(named: "wallpaper")!)
//            catVC.navigationController?.navigationBar.tintColor = .white
            
            
            
            }
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        selectedCategory = categories[indexPath.row]
        
        print(celestials)
        elemCat = getBodiesByCategory(celestials, selectedCategory)
        print(selectedCategory)
        performSegue(withIdentifier: "category", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedCell = tableView.cellForRow(at: indexPath)
        deselectedCell?.backgroundColor = .clear
        
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear
    }
    
    ///To make navigation item disappear
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    ///To make navigation item appear in other views
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
}
