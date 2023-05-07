//
//  ViewController.swift
//  SeeSky
//
//  Created by Juan Liut on 23/03/23.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
        let planetes = try! ThePlanets.loadScena()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(planetes)
    }
}
