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
    var angle = CGPoint.init(x: 0, y: 0)

    // MARK: IBOutlet
    @IBOutlet weak var blueView: UIView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dice"
        
        let layer = CALayer()
        layer.frame = blueView.bounds
        layer.backgroundColor = UIColor.blue.cgColor
        blueView.layer.addSublayer(layer)
    }
    
    // MARK: IBAction
    @IBAction func padOnBlueView(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: blueView)
        let angleX = angle.x + (point.x/30)
        let angleY = angle.y - (point.y/30)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        blueView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angleX
            angle.y = angleY
        }
    }
    
}
