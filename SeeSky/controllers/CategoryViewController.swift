//
//  CategoryViewController.swift
//  SeeSky
//
//  Created by Juan Liut on 23/04/23.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var categoryName: UILabel!
    
    @IBOutlet weak var tableCatElem: UITableView!
    
    var selectedCategory : String = ""
    
    var elemCategory : [Celestial] = []
    
    var selectedCelestial : Celestial = defaultCelestial

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView?.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
       
        ///Background
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        
        ///Text graphics
//        categoryName.textColor = .white
        ///Table
        tableCatElem.backgroundColor = .clear
        
//        elemCategory = getListType(selectedCategory)
        
//        categoryName.text = selectedCategory
        
        tableCatElem.delegate = self
        tableCatElem.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elemCategory = getBodiesByCategory(celestials, selectedCategory)
        
        
        return elemCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCatElem.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ElemTableViewCell
        
        ///Content
        cell.backgroundColor = .clear
        ///Hstack
        cell.hStack.layer.cornerRadius = 16
        cell.hStack.layer.borderWidth = 2
        cell.hStack.layer.borderColor = CGColor(gray: 1, alpha: 0.3)
        cell.hStack.backgroundColor = UIColor(cgColor: CGColor(red: 8/255, green: 11/255, blue: 23/255, alpha: 1))
        ///Text
        cell.name.textColor = .white
        cell.name.text = "\t\(elemCategory[indexPath.row].englishName)"
        
        
        cell.celestial = elemCategory[indexPath.row]
        
        if searchIfItFav(elemCategory[indexPath.row].englishName) {
            cell.btn.setImage(UIImage(systemName: "star.fill")?.withTintColor(.white), for: .normal)
        }
        else {
            cell.btn.setImage(UIImage(systemName: "star")?.withTintColor(.white), for: .normal)
        }
        
        ///Button Star
//        if elemCategory[indexPath.row].isFavorite {
//            cell.btn.setImage(UIImage(systemName: "star.fill")?.withTintColor(.white), for: .normal)
//        } else {
//            cell.btn.setImage(UIImage(systemName: "star")?.withTintColor(.white), for: .normal)
//        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "celestial"){
            
            guard let celVC = segue.destination as? CelestialViewController else {return}
            
            celVC.selectedCelestial = selectedCelestial
            celVC.navigationItem.title = "\(selectedCelestial.englishName)"
            
            
            }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCelestial = elemCategory[indexPath.row]
        
        performSegue(withIdentifier: "celestial", sender: nil)
    }
    

}
