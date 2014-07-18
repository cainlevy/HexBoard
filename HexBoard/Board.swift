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
    var rings: [[HexTile]]

    @lazy var node: SCNNode = {
        let n = SCNNode()
        for t in self.tiles {
            n.addChildNode(t.node)
        }
        return n
    }()

    init(size: Int) {
        let origin = CGPointZero

        // begin with origin tile
        tiles = [
            HexTile(center: origin)
        ]
        rings = [
            [tiles[0]]
        ]

        // add rings
        for r in 1...size {
            // gather neighboring points
            var points = [CGPoint]()
            for t in rings[r - 1] {
                // all neighboring points of extension from the previous ring
                points += t.shape.midpoints.map{ mp in
                    return CGPoint(
                        x: 2 * mp.x - t.shape.center.x,
                        y: 2 * mp.y - t.shape.center.y
                    )
                // that are not already a tile
                }
            }
            points = unique(points).filter{ p in
                self.tiles.any{ $0.shape.center != p }
            }
            rings.append(points.map{ HexTile(center: $0) })
            tiles += rings[r]
        }
    }
}
