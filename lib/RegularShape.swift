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
    let sides: Int
    let radius: CGFloat
    let center: CGPoint


    @lazy var points: [CGPoint] = {
        // determine vertices by assuming a regular angle
        var angle = (2 * pi) / Double(self.sides)
        return self.sides.times().map{ (i) in
            var degrees = Double(i) * angle
            return CGPoint(
                x: (CGFloat(cos(degrees)) + self.center.x) * self.radius,
                y: (CGFloat(sin(degrees)) + self.center.y) * self.radius
            )
        }
    }()

    @lazy var midpoints: [CGPoint] = {
        return self.sides.times().map{ (i) in
            var p1 = self.points[i]
            var p2 = self.points[(i + 1) % self.sides]
            return CGPoint(
                x: (p2.x + p1.x) / 2,
                y: (p2.y + p1.y) / 2
            )
        }
    }()

    // calculates a shape with equal sides and inner angles
    // - radius: defaults to a single unit (1.0)
    // - center: defaults to the origin (0, 0)
    init(sides: Int, radius: CGFloat = 1.0, center: CGPoint = CGPointZero) {
        self.sides  = sides
        self.radius = radius
        self.center = center
    }
}
