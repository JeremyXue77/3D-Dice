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
    var service: DiceService?
    
    // MARK: IBOutlet
    @IBOutlet weak var diceView: DiceView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Dice"
        service = DiceService(diceView: diceView)
    }
    
    // MARK: IBAction
    @IBAction func start(_ sender: UIButton) {
        service?.startRolling()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        service?.stopRolling()
    }
}
