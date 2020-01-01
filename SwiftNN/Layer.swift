//
//  Layer.swift
//  SwiftNN
//
//  Created by PointerFLY on 1/1/20.
//  Copyright © 2020 PointerFLY. All rights reserved.
//

import Foundation

class Layer {
    
    private let inputSize: Int
    private let outputSize: Int
    private let activation: Activation
    private var matrix: [[Double]]
    
    init(inputSize: Int, outputSize: Int, activation: Activation) {
        self.inputSize = inputSize
        self.outputSize = outputSize
        self.activation = activation
        
        let row = [Double](repeating: 0, count: inputSize)
        matrix = [[Double]](repeating: row, count: outputSize)
        
        for i in 0..<outputSize {
            for j in 0..<inputSize {
                matrix[i][j] = Double.random(in: 0...1)
            }
        }
    }
    
    func feedForward(vector: [Double]) -> [Double] {
        var newVector = [Double]()
        for row in matrix {
            var sum = 0.0
            for i in 0..<row.count {
                sum += row[i] * vector[i]
            }
            newVector.append(sum)
        }
        
        return newVector
    }
    
    func backPropagate(vector: [Double]) {
        
    }
}
