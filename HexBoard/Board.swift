//
//  Board.swift
//  HexBoard
//
//  Created by Lance Ivy on 7/7/14.
//  Copyright (c) 2014 Lance Ivy. All rights reserved.
//

import Foundation
import SceneKit

let hexShape = RegularShape(sides: 6)

class HexBoard {
    class HexTile: Tile {
        init(center: CGPoint) {
            super.init(shape: hexShape, center: center)
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
        // begin with origin tile
        tiles = [
            HexTile(center: CGPoint(x: 0, y: 0))
        ]

        // add rings
        for ring in 1...rings {
            // tiles per ring
            for i in 0..<6 {
                // find center from origin tile
                var midpoint = hexShape.midpoints[i]
                var lengths = CGFloat(2 * ring)
                tiles.append(HexTile(center: CGPoint(
                    x: tiles[0].center.x + midpoint.x * lengths,
                    y: tiles[0].center.y + midpoint.y * lengths
                )))
            }
        }
    }
}
