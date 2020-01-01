//
//  Model.swift
//  SwiftNN
//
//  Created by PointerFLY on 1/1/20.
//  Copyright © 2020 PointerFLY. All rights reserved.
//

import Foundation

class Model {
    
    private var layers = [Layer]()
    
    func addLayer(_ layer: Layer) {
        layers.append(layer)
    }
    
    func predict(_ input: [Double]) -> [Double] {
        var output = input
        for layer in layers {
            output = layer.feedForward(vector: output)
        }
        
        return output
    }
    
    func train(x: [Double], y: [Double]) {
        
    }
}
