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

    var midpoints: [CGPoint] {
        return sides.times().map{ (i) in
            var p1 = self.points[i]
            var p2 = self.points[(i + 1) % self.sides]
            return CGPoint(
                x: (p2.x + p1.x) / 2,
                y: (p2.y + p1.y) / 2
            )
        }
    }
}
