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
    
    func predict(x: [Double]) -> [Double] {
        var output = x
        for layer in layers {
            output = layer.feedForward(vector: output)
        }
        
        return output
    }

    func train(xList: [[Double]], labels: [[Double]], loss: Loss, iteration: Int = 100) {
        for i in 0..<iteration {
            var totalLoss = 0.0
            for x in xList {
                for label in labels {
                    let y = predict(x: x)
                    totalLoss += loss.call(y: y, label: label)
                }
            }

        }
    }
}
