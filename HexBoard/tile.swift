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
    var shape: RegularShape
    
    @lazy var border: UIBezierPath = {
        var path = UIBezierPath()
        path.moveToPoint(self.shape.points[0])
        for i in self.shape.points {
            path.addLineToPoint(i)
        }
        path.closePath()
        return path
    }()
    
    @lazy var node: SCNNode = {
        var n = SCNNode()
        n.geometry = SCNShape(path: self.border, extrusionDepth: self.shape.radius * 0.1)
        
        // create and configure a material
        let material = SCNMaterial()
        material.diffuse.contents = Element.rand().color
        material.specular.contents = UIColor.whiteColor()
        material.locksAmbientWithDiffuse = true
        n.geometry.firstMaterial = material
        
        return n
    }()
    
    init(sides: Int, center: CGPoint) {
        self.shape = RegularShape(sides: sides, center: center)
    }

    struct Element {
        let color: UIColor

        static let all = [
            "earth": Tile.Element(color: UIColor.brownColor()),
            "water": Tile.Element(color: UIColor.blueColor()),
            "fire":  Tile.Element(color: UIColor.redColor()),
            "air":   Tile.Element(color: UIColor.grayColor())
        ]

        static func rand() -> Element {
            let elements = Array(all.values)
            return elements[random() % elements.count]
        }
    }
}