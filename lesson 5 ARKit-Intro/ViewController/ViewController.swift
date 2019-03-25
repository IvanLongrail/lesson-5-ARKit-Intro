//
//  ViewController.swift
//  lesson 5 ARKit-Intro
//
//  Created by Иван longrail on 25/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    var snowIntensity:Int = 40
    var timer:Timer?
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var startSnowfallButton: UIButton!
    @IBOutlet weak var stopSnowfallButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopSnowfallButton.isHidden = true
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]

        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/city/city.scn")!

        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    @IBAction func startSnowfall() {
        snowfall()
        startSnowfallButton.isHidden = true
        stopSnowfallButton.isHidden = false
    }
    
    @IBAction func stopSnowfall() {
        endingSnowfall()
        stopSnowfallButton.isHidden = true
        startSnowfallButton.isHidden = false
    }
    
}
