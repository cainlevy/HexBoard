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
    
    var border: UIBezierPath {
        var path = UIBezierPath()
        path.moveToPoint(shape.points[0])
        for i in shape.points {
            path.addLineToPoint(i)
        }
        path.closePath()
        return path
    }
    
    var node: SCNNode {
        var n = SCNNode()
        n.geometry = SCNShape(path: border, extrusionDepth: shape.radius * 0.1)
        
        // create and configure a material
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "texture")
        material.specular.contents = UIColor.blueColor()
        material.locksAmbientWithDiffuse = true
        n.geometry.firstMaterial = material
        
        return n
    }
    
    init(sides: Int, center: CGPoint) {
        self.shape = RegularShape(sides: sides, center: center)
    }
}