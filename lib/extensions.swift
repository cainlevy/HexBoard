//
//  extensions.swift
//  HexBoard
//
//  Created by Lance Ivy on 7/7/14.
//  Copyright (c) 2014 Lance Ivy. All rights reserved.
//

import Foundation

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

