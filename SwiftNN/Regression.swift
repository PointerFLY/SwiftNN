//
//  LinearRegression.swift
//  SwiftNN
//
//  Created by PointerFLY on 5/1/20.
//  Copyright © 2020 PointerFLY. All rights reserved.
//

import Foundation

struct Regression {
    
    static func run() {
        let model = Model()
        model.addLayer(Layer(inputSize: 1, outputSize: 4, activation: Relu()))
        model.addLayer(Layer(inputSize: 4, outputSize: 4, activation: Relu()))
        model.addLayer(Layer(inputSize: 4, outputSize: 1, activation: Relu()))
        
        print(model.predict(x: [500]))
        
        let (xList, labels) = generateTrainingData(1000)
        model.train(xList: xList, labels: labels,
                    loss: RMSE(),
                    iteration: 100,
                    learningRate: 0.0001)
        
        print(model.predict(x: [10]))
        print(model.predict(x: [90]))
    }
    
    static func generateTrainingData(_ size: Int) -> ([[Double]], [[Double]]) {
        let xList: [[Double]] = (0..<size).map { _ in [Double.random(in: 0...1)]}
        let labels = xList.map { [targetFunc(x: $0[0])] }
        return (xList, labels)
    }
    
    static func targetFunc(x: Double) -> Double {
        return x * 5 + 10
    }
}
