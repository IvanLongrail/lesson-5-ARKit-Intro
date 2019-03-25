//
//  SnowModel.swift
//  lesson 5 ARKit-Intro
//
//  Created by Иван longrail on 25/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import ARKit

class Snowflake: SCNNode {
    
    init(_ x: Float, _ y: Float, _ z: Float) {
        super.init()
        
        let position = SCNVector3(x, y, z)
        self.position = position
        
        let snowflake = SCNSphere(radius: 0.02)
        self.geometry = snowflake
        
        let shape = SCNPhysicsShape(geometry: snowflake, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: shape)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.white
        self.geometry?.materials  = [material]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewController {
    
    func snowfall() {
         timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(createSnowflakes(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc func createSnowflakes(timer: Timer) {
        for _ in 1...snowIntensity {
            let x = Float.random(in: -10...10)
            let y = Float(20)
            let z = Float.random(in: -10...10)
            let snowflake = Snowflake(x, y, z)
            sceneView.scene.rootNode.addChildNode(snowflake)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                snowflake.removeFromParentNode()
            }
        }
    }
    
    func endingSnowfall() {
        timer?.invalidate()
    }
}

