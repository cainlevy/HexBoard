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
    
    var points: CGPoint[] {
        return sides.times().map{ (i) in
            var degrees = Double(i) * self.angle
            return CGPoint(
                x: cos(degrees),
                y: sin(degrees)
            )
        }
    }
}

let pi = 3.14159 // TODO: where is this supposed to come from?

extension Int {
    func times(fn: () -> ()) {
        for i in 0..self {
            fn()
        }
    }
    
    // TODO: surely this can be easier
    func times() -> Int[] {
        var arr = Int[]()
        for i in 0..self {
            arr += i
        }
        return arr
    }
}

extension Double {
    func times() -> Int[] {
        return Int(self).times()
    }
}

