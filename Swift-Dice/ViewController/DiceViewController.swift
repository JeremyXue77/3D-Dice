//
//  DiceViewController.swift
//  Swift-Dice
//
//  Created by Jeremy Xue on 2020/4/14.
//  Copyright © 2020 Jeremy Xue. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {
    
    // MARK: Property
    let diceView = UIView()
    let size = CGSize(width: 100, height: 100)
    var angle = CGPoint(x: 0, y: 0)

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dice"
        setupDiceView()
        addDiceImageView()
    }
    
    // MARK: Setting method
    func setupDiceView() {
        diceView.frame.size = size
        diceView.center = view.center
        view.addSubview(diceView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform(sender:)))
        diceView.addGestureRecognizer(panGesture)
    }
    
    func addDiceImageView() {
        
        var diceTransform = CATransform3DIdentity
        
        let dice1ImageView = DiceImageView(point: 1)
        dice1ImageView.frame.size = diceView.frame.size
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice1ImageView.layer.transform = diceTransform
        diceView.addSubview(dice1ImageView)
        
        let dice6ImageView = DiceImageView(point: 6)
        dice6ImageView.frame.size = diceView.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, .pi * 2, 0, 0, 1)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, -50)
        dice6ImageView.layer.transform = diceTransform
        diceView.addSubview(dice6ImageView)
        
        let dice2ImageView = DiceImageView(point: 2)
        dice2ImageView.frame.size = diceView.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, .pi / 2, 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice2ImageView.layer.transform = diceTransform
        diceView.addSubview(dice2ImageView)
        
        let dice5ImageView = DiceImageView(point: 5)
        dice5ImageView.frame.size = diceView.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, -.pi / 2, 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice5ImageView.layer.transform = diceTransform
        diceView.addSubview(dice5ImageView)
        
        let dice3ImageView = DiceImageView(point: 3)
        dice3ImageView.frame.size = diceView.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, -.pi / 2, 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice3ImageView.layer.transform = diceTransform
        diceView.addSubview(dice3ImageView)
        
        let dice4ImageView = DiceImageView(point: 4)
        dice4ImageView.frame.size = diceView.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, .pi / 2, 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice4ImageView.layer.transform = diceTransform
        diceView.addSubview(dice4ImageView)
    }
}

// MARK: DiceViewController Methods
extension DiceViewController {
    
    @objc func viewTransform(sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: diceView)
        let angleX = angle.x + (point.x/30)
        let angleY = angle.y - (point.y/30)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        diceView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angleX
            angle.y = angleY
        }
    }
}
