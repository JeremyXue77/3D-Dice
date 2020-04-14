//
//  DiceView.swift
//  Swift-Dice
//
//  Created by Jeremy Xue on 2020/4/14.
//  Copyright © 2020 Jeremy Xue. All rights reserved.
//

import UIKit

class DiceView: UIView {
    
    // MARK: Property
    private var angle = CGPoint(x: 0, y: 0)

    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDiceViewPanGesture()
        addDiceImageViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDiceViewPanGesture()
        addDiceImageViews()
    }
    
    // MARK: Setting method
    private func setupDiceViewPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform(sender:)))
        self.addGestureRecognizer(panGesture)
    }
    
    private func addDiceImageViews() {
        
        var diceTransform = CATransform3DIdentity
        
        let offset = bounds.width / 2
        
        let dice1ImageView = DiceImageView(point: 1)
        dice1ImageView.frame.size = self.frame.size
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, offset)
        dice1ImageView.layer.transform = diceTransform
        self.addSubview(dice1ImageView)
        
        let dice6ImageView = DiceImageView(point: 6)
        dice6ImageView.frame.size = self.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, .pi * 2, 0, 0, 1)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, -offset)
        dice6ImageView.layer.transform = diceTransform
        self.addSubview(dice6ImageView)
        
        let dice2ImageView = DiceImageView(point: 2)
        dice2ImageView.frame.size = self.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, .pi / 2, 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, offset)
        dice2ImageView.layer.transform = diceTransform
        self.addSubview(dice2ImageView)
        
        let dice5ImageView = DiceImageView(point: 5)
        dice5ImageView.frame.size = self.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, -.pi / 2, 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, offset)
        dice5ImageView.layer.transform = diceTransform
        self.addSubview(dice5ImageView)
        
        let dice3ImageView = DiceImageView(point: 3)
        dice3ImageView.frame.size = self.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, -.pi / 2, 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, offset)
        dice3ImageView.layer.transform = diceTransform
        self.addSubview(dice3ImageView)
        
        let dice4ImageView = DiceImageView(point: 4)
        dice4ImageView.frame.size = self.frame.size
        diceTransform = CATransform3DRotate(CATransform3DIdentity, .pi / 2, 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, offset)
        dice4ImageView.layer.transform = diceTransform
        self.addSubview(dice4ImageView)
    }
    
    // MARK: Action
    @objc func viewTransform(sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self)
        let isEnded = (sender.state == .ended)
        transform(point: point, isEnded: isEnded)
    }
}

// MARK: - DiceView Methods
extension DiceView {
    
    func transform(point: CGPoint, isEnded: Bool) {
        let angleX = angle.x + (point.x/30)
        let angleY = angle.y - (point.y/30)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        self.layer.sublayerTransform = transform
        
        if isEnded {
            angle.x = angleX
            angle.y = angleY
        }
    }
}
