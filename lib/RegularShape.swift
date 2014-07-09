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
    var points: [CGPoint]

    var radius: CGFloat
    var center: CGPoint

    // TODO: memoize?
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

    // calculates a shape with equal sides and inner angles
    // - radius: defaults to a single unit (1.0)
    // - center: defaults to the origin (0, 0)
    init(sides: Int, radius: CGFloat = 1.0, center: CGPoint = CGPointZero) {
        self.sides  = sides
        self.radius = radius
        self.center = center

        // determine vertices by assuming a regular angle
        var angle = (2 * pi) / Double(sides)
        self.points = sides.times().map{ (i) in
            var degrees = Double(i) * angle
            return CGPoint(
                x: (CGFloat(cos(degrees)) + center.x) * radius,
                y: (CGFloat(sin(degrees)) + center.y) * radius
            )
        }
    }
}
