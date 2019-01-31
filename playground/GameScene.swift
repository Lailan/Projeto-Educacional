//
//  GameScene.swift
//  playground
//
//  Created by Lailan Rogerio Rodrigues Matos on 31/01/19.
//  Copyright © 2019 Lailan Rogerio Rodrigues Matos. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
   
    var objetoMovel = SKSpriteNode(color: UIColor.lightGray, size: CGSize(width: 140, height: 140))
    var objetoFixo = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 150, height: 150))
    var objetoFake = SKSpriteNode(color: UIColor.orange, size: CGSize(width: 150, height: 150))
   
    var touchEncontrou = false
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       
        objetoFixo.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        objetoFixo.position = CGPoint(x: 190, y: -300)
        objetoFake.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        objetoFake.position = CGPoint(x: -190, y: 200)
        objetoMovel.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        objetoMovel.position = CGPoint(x: 0, y: 0)
       
        self.addChild(objetoFixo)
        self.addChild(objetoFake)
        self.addChild(objetoMovel)
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            objetoMovel.position.x = location.x
            objetoMovel.position.y = location.y
            validarSeElementosEncontraram(objetoMovel)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func validarSeElementosEncontraram(_ objetoMovel:SKSpriteNode){
        let posicaoXfixa = objetoFixo.position.x
        let posicaoYfixa = objetoFixo.position.y
        if (objetoMovel.position.x > posicaoXfixa-10 ) && (objetoMovel.position.x < posicaoXfixa+10) && (objetoMovel.position.y > posicaoYfixa-10 ) && (objetoMovel.position.y < posicaoYfixa+10){
            objetoMovel.color = UIColor.green
            if !(touchEncontrou) {
                vibrarTela()
                touchEncontrou = true
            }
        } else {
            objetoMovel.color = UIColor.lightGray
            if touchEncontrou {
               touchEncontrou = false
            }
        }
    }
   
    func vibrarTela(){
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
