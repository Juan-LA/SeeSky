//
//  NavigationViewController.swift
//  SeeSky
//
//  Created by Marco Di Bernardo on 07/05/23.
//

import UIKit

class NavigationViewController: UINavigationController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let fonta = UIFont(name: "Avenir-Book", size: 10) {
            self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: fonta]
        }
        // Do any additional setup after loading the view.
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
