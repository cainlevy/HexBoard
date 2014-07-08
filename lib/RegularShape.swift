//
//  RegularShape.swift
//  HexBoard
//
//  Created by Lance Ivy on 7/6/14.
//  Copyright (c) 2014 Lance Ivy. All rights reserved.
//

import Foundation // for cos() and sin()
import UIKit

struct RegularShape {
    var sides: Int
    
    var angle: Double {
        return (2 * pi) / Double(sides)
    }
    
    var points: [CGPoint] {
        return sides.times().map{ (i) in
            var degrees = Double(i) * self.angle
            return CGPoint(
                x: CGFloat(cos(degrees)),
                y: CGFloat(sin(degrees))
            )
        }
    }
}
