//
//  Tile.swift
//  HexBoard
//
//  Created by Lance Ivy on 7/6/14.
//  Copyright (c) 2014 Lance Ivy. All rights reserved.
//

import UIKit
import SceneKit

class Tile {
    let shape: RegularShape
    let center: CGPoint
    let radius = 1.0
    
    var border: UIBezierPath {
        var path = UIBezierPath()
        path.moveToPoint(CGPoint(
            x: center.x + shape.points[0].x,
            y: center.y + shape.points[0].y
        ))
        for i in shape.points {
            var adjustedPoint = CGPoint(
                x: i.x + center.x,
                y: i.y + center.y
            )
            path.addLineToPoint(adjustedPoint)
        }
        path.closePath()
        return path
    }
    
    var node: SCNNode {
        var n = SCNNode()
        n.geometry = SCNShape(path: border, extrusionDepth: radius * 0.1)
        
        // create and configure a material
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "texture")
        material.specular.contents = UIColor.blueColor()
        material.locksAmbientWithDiffuse = true
        n.geometry.firstMaterial = material
        
        return n
    }
    
    init(shape: RegularShape, center: CGPoint) {
        self.shape  = shape
        self.center = center
    }
}