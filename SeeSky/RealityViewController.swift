//
//  RealityViewController.swift
//  SeeSky
//
//  Created by Juan Liut on 22/05/23.
//

import UIKit
import SceneKit

class RealityViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = UIColor.black
        //UIColor(patternImage: UIImage(named: "wallpaper")!)
        
        // 1: Load .obj file
        guard let scene = SCNScene(named: "Solar_System.scn") else {
            print("NON HO NIENTE")
            return
        }
        
        
        // 2: Add camera node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        // 3: Place camera
        cameraNode.position = SCNVector3(x: 0, y: 10, z: 35)
        
        // 4: Set camera on scene
        scene.rootNode.addChildNode(cameraNode)
        
        // 5: Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 35)
        scene.rootNode.addChildNode(lightNode)
        
        // 6: Creating and adding ambien light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.red
        scene.rootNode.addChildNode(ambientLightNode)
        
        // If you don't want to fix manually the lights
//        sceneView.autoenablesDefaultLighting = true
        
        // Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        
        
        // Show FPS logs and timming
        // sceneView.showsStatistics = true
        
        // Set background color
        sceneView.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper")!)
        
        // Allow user translate image
        sceneView.cameraControlConfiguration.allowsTranslation = false
        
        // Set scene settings
        sceneView.scene = scene
        
    }
    
    
}
