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

    func train(xList: [[Double]], labels: [[Double]], loss: Loss, iteration: Int, learningRate: Double) {
        for _ in 0..<iteration {
            var error = 0.0
            
            for i in 0..<xList.count {
                let x = xList[i]
                let label = labels[i]
                let y = predict(x: x)
                error += loss.call(y: y, label: label)
                
                var gradient = loss.gradient(y: y, label: label)
                for layer in layers.reversed() {
                    gradient = layer.backPropagate(vector: gradient, learningRate: learningRate)
                }
            }
            
            print("Training error: \(error)")
        }
    }
}
