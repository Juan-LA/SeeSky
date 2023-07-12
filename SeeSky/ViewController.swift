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
        self.navigationController?.navigationBar.isHidden = true
        
        // Load the "Box" scene from the "Experience" Reality File
        guard let anchor = try? Solarsystem.loadScena() else { return }
        // Add the box anchor to the scene
        anchor.position = SIMD3(x: 10, y: 10, z: 0)
        arView.scene.anchors.append(anchor)
        
        
        
        
        
        
    }
}
