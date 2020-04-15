//
//  DiceService.swift
//  Swift-Dice
//
//  Created by Jeremy Xue on 2020/4/14.
//  Copyright © 2020 Jeremy Xue. All rights reserved.
//

import UIKit

class DiceService {
    
    // MARK: Property
    let diceView: DiceView
    private var timer: Timer?
    
    // MARK: Initailizer
    init(diceView: DiceView) {
        self.diceView = diceView
    }
}

// MARK: - DiceService methods
extension DiceService {
    
    func startRolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true, block: {
                                        [weak self](timer) in
                                        self?.rollingDice()
        })
        timer?.fire()
    }
    
    private func rollingDice() {
        let x = CGFloat.random(in: 0...self.diceView.bounds.width)
        let y = CGFloat.random(in: 0...self.diceView.bounds.width)
        let point = CGPoint(x: x, y: y)
        self.diceView.transform(point: point,
                                isEnded: true)
    }
    
    func stopRolling() {
        timer?.invalidate()
        timer = nil
        let point = Int.random(in: 1...6)
        diceView.transform(to: point)
    }
}
