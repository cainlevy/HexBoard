//
//  Board.swift
//  HexBoard
//
//  Created by Lance Ivy on 7/7/14.
//  Copyright (c) 2014 Lance Ivy. All rights reserved.
//

import Foundation
import SceneKit

class HexBoard {
    class HexTile: Tile {
        init(center: CGPoint) {
            super.init(sides: 6, center: center)
        }
    }

    var tiles: [HexTile]

    var node: SCNNode {
        var n = SCNNode()
        for t in tiles {
            n.addChildNode(t.node)
        }
        return n
    }

    init(rings: Int) {
        var origin = CGPointZero

        // begin with origin tile
        tiles = [
            HexTile(center: origin)
        ]

        // add rings
        for ring in 1...rings {
            // tiles per ring
            for i in 0..<6 {
                // find center from origin tile
                var midpoint = tiles[0].shape.midpoints[i]
                var lengths = CGFloat(2 * ring)
                tiles.append(HexTile(center: CGPoint(
                    x: origin.x + midpoint.x * lengths,
                    y: origin.y + midpoint.y * lengths
                )))
            }
        }
    }
}
