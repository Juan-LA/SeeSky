//
//  SearchClickedViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 27/04/23.
//

import UIKit

class SearchClickedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    
    let planetsFake = ["moon", "mars", "jove", "venus", "pluton"]
    
    var elem: [String]?
    
//    var searchBar: UISearchBar?
    
    @IBOutlet weak var table: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
//        searchBar?.isHidden = false
//        searchBar?.isUserInteractionEnabled = true
//        searchBar?.alpha = 1.0
//        searchBar?.delegate = self
//        searchBar?.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: 50)
//        view.addSubview(searchBar!)
        // Do any additional setup after loading the view.
    }
    
    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//    // handle the search button action
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
//    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elem?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cellElemSearched") as! SearchedElementsTableViewCell
        
        cell.elemLbl.text = elem?[indexPath.row]
        
        
        return cell
        
        
    }

}
