//
//  DiceImageView.swift
//  Swift-Dice
//
//  Created by Jeremy Xue on 2020/4/14.
//  Copyright © 2020 Jeremy Xue. All rights reserved.
//

import UIKit

class DiceImageView: UIImageView {
    
    // MARK: Property
    let point: Int

    // MARK: Initializer
    init(point: Int) {
        self.point = point
        let image = UIImage(named: "dice\(point)")
        super.init(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
