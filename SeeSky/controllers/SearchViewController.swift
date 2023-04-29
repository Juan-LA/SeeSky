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
    
    @IBOutlet weak var VwForSearchElem: UIView!
    
    @IBOutlet weak var tableFiltered: UITableView!
    
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
    var filteredBodies : [Celestial] = getBodies()
    var bodies : [Celestial] = getBodies()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlePage.textColor = .white
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        self.navigationController?.navigationBar.tintColor = .white
        
        self.tabBarController?.tabBar.tintColor = .white
        
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
        
        VwForSearchElem.isHidden = true
        
        ///Search section
        self.VwForSearchElem.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        
        tableFiltered.delegate = self
        tableFiltered.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let totalHeight = OTDSectionTitle.frame.height + sectionOTD.frame.height + CategoriesSectTitle.frame.height + sectionCategories.contentSize.height
//
//        scroll.contentSize = CGSize(width: view.frame.width, height: totalHeight)
//    }
    
    
    ///Num of elements available in OTD section
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
    
    

    
    ///Number of rows in Categories table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableFiltered{
            return filteredBodies.count
        } else {
            return categories.count + 1
        }
    }
    
    ///Function to create cell of table Categories
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tableFiltered {
            if indexPath.row == filteredBodies.count {
                let cell = UITableViewCell()
                cell.backgroundColor = .clear
                
                return cell
            } else {
                
                let cell = tableFiltered.dequeueReusableCell(withIdentifier: "cellElemSearched", for: indexPath) as! SearchedElementsTableViewCell
                
                ///Content
                ///Hstack
                cell.hStack.layer.cornerRadius = 16
                cell.hStack.backgroundColor = UIColor(cgColor: CGColor(red: 8/255, green: 11/255, blue: 23/255, alpha: 1))
            
                ///Text
                cell.elemLbl.text = "\t\(filteredBodies[indexPath.row].englishName)"
                cell.hStack.layer.borderWidth = 2
                cell.hStack.layer.borderColor = CGColor(gray: 1, alpha: 0.3)
                cell.img.kf.setImage(with: URL(string: imgUrls[0]))
                cell.elemLbl.textColor = .white
                
                ///View with image inside
                cell.img.layer.cornerRadius = 16
                cell.img.backgroundColor = .clear
                
                ///Img
                cell.img.layer.cornerRadius = 16
                cell.backgroundColor = .clear
                
                return cell
            }
        } else {
            if indexPath.row == categories.count {
                let cell = UITableViewCell()
                cell.backgroundColor = .clear
                
                return cell
            } else {
                
                let cell = sectionCategories.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
                
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
        
        
    }
    
    ///Height of row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == categories.count{
            return 40
        } else {
            return 120 // altezza della cella
        }
        
    }

    ///Returns the number of the selected row
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
        
        ///Prepare fot Category controller
        if (segue.identifier == "category"){
            
            guard let catVC = segue.destination as? CategoryViewController else {return}
            
            catVC.selectedCategory = selectedCategory
            
            catVC.elemCategory = elemCat
            
            catVC.navigationItem.title = "\(selectedCategory)s"
            
            }
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        ///Preparing data to send to Category Controller when selecting a row
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



extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    }
    
    ///What happens when the string is deleted from searchbar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.scroll.isHidden = false
        VwForSearchElem.isHidden = true
    }
    
    ///What happens when the bar is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            if !searchBar.frame.contains(touch.location(in: view)) {
                searchBar.resignFirstResponder()
                scroll.isHidden = false
                VwForSearchElem.isHidden = true
            }
        }
    }

    ///If text inside searchbar changes
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
                ///Takes the string inside the searchbar
                guard let searchText = searchBar.text else {
                    return
                }
                
                guard !searchText.isEmpty && searchText != " " && searchText.trimmingCharacters(in: .whitespacesAndNewlines).count != 0 else {
                    self.scroll.isHidden = false
                    VwForSearchElem.isHidden = true
                    return
                }
                
                self.scroll.isHidden = true
                
                VwForSearchElem.isHidden = false
                
                print(searchText)

//                guard let searchedElemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "searchedElemVC") as? SearchClickedViewController else { return }
           
                
                filteredBodies = bodies.filter { $0.englishName.lowercased().contains(searchText.lowercased())
                }
                
                let mapping = filteredBodies.map{
                    $0.englishName
                }
                print("BOH", mapping)

        self.tableFiltered.reloadData()
        
        
    }
        //        searchedElemVC.searchBar = searchBar

        //        searchBar.delegate = searchedElemVC


        //        searchedElemVC.view.addSubview(searchBar)

        
        
        
//                self.addChild(searchedElemVC)
//
//                searchedElemVC.view.frame = VwForSearchElem.bounds
//
//                VwForSearchElem.addSubview(searchedElemVC.view)
//                searchedElemVC.didMove(toParent: self)
        
        
        
        
        //        searchedElemVC.didMove(toParent: self)

        //        activate the search bar
        //        searchBar.isHidden = false
        //        searchBar.isUserInteractionEnabled = true
        //        searchBar.alpha = 1.0


        //        hide all the existent views except for searchBar and the new view (searchElemVC)
        //        self.view.subviews.forEach {
        //            if $0 != searchedElemVC.view && $0 != searchBar {
        //                $0.isHidden = true
        //            }
        //        }
                

    
    
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
////        let planetsFake = ["moon", "mars", "venus", "sun", "fakeplanets"]
////
//        guard let searchText = searchBar.text else {
//            return
//        }
//
//        guard !searchText.isEmpty && searchText != " " && searchText.trimmingCharacters(in: .whitespacesAndNewlines).count != 0 else {
//            return
//        }
//
//        self.scroll.isHidden = true
//
//        VwForSearchElem.isHidden = false
//
//        print(searchText)
//
//        guard let searchedElemVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "searchedElemVC") as? SearchClickedViewController else { return }
//
//
//        let bodies = getBodies()
//
//        let filteredBodies = bodies.filter { $0.englishName.lowercased().contains(searchText.lowercased())
//        }
//
//        let boh = filteredBodies.map{
//            $0.englishName
//        }
//        print("BOH", boh)
//
//        searchedElemVC.elem = filteredBodies
////        searchedElemVC.searchBar = searchBar
//
////        searchBar.delegate = searchedElemVC
//
//
////        searchedElemVC.view.addSubview(searchBar)
//
//        self.addChild(searchedElemVC)
//
//        searchedElemVC.view.frame = VwForSearchElem.bounds
//
//        VwForSearchElem.addSubview(searchedElemVC.view)
//        searchedElemVC.didMove(toParent: self)
////        searchedElemVC.didMove(toParent: self)
//
////        activate the search bar
////        searchBar.isHidden = false
////        searchBar.isUserInteractionEnabled = true
////        searchBar.alpha = 1.0
//
//
////        hide all the existent views except for searchBar and the new view (searchElemVC)
////        self.view.subviews.forEach {
////            if $0 != searchedElemVC.view && $0 != searchBar {
////                $0.isHidden = true
////            }
////        }
//
//
//    }
//
    
}

