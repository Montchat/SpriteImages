//
//  GameScene.swift
//  ExploreSpriteImages
//
//  Created by Joe E. on 10/29/15.
//  Copyright (c) 2015 Joe E. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        
        scene?.backgroundColor = SKColor.blackColor()
        
        view.showsFields = true
        view.showsPhysics = true
        size = view.frame.size
        
        let monkeyAtlas = SKTextureAtlas(named: "Monkey")
        
        let monkey = SKSpriteNode(texture: monkeyAtlas.textureNamed("monkey1"))
        monkey.position = view.center
        addChild(monkey)
        
        let monkeyTextures = monkeyAtlas.textureNames.map {
            SKTexture(imageNamed: $0)
            
        }
        
        let action = SKAction.animateWithTextures(monkeyTextures, timePerFrame: 0.50)
        monkey.runAction(SKAction.repeatActionForever(action))
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let balloon = SKSpriteNode(imageNamed: "balloon")
            
            balloon.position = location
            balloon.physicsBody = SKPhysicsBody(texture: balloon.texture!, size: balloon.frame.size)
            
            balloon.physicsBody?.restitution = 0.8
            balloon.physicsBody?.linearDamping = 0.8
            
            addChild(balloon)
            
        }
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
