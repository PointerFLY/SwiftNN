//
//  Layer.swift
//  SwiftNN
//
//  Created by PointerFLY on 1/1/20.
//  Copyright © 2020 PointerFLY. All rights reserved.
//

import Foundation

class Layer {
    
    private let columns: Int
    private let rows: Int
    private var matrix: [[Double]]
    private let bias = 1.0
    private let activation: Activation
    private var lastInput: [Double]
    private var lastSums: [Double]
    
    init(inputSize: Int, outputSize: Int, activation: Activation) {
        self.columns = inputSize + 1 // Plus one for bias
        self.rows = outputSize
        self.activation = activation
        self.lastInput = [Double](repeating: 0.0, count: inputSize)
        self.lastSums = [Double](repeating: 0.0, count: outputSize)
        
        let row = [Double](repeating: 0, count: columns)
        matrix = [[Double]](repeating: row, count: rows)
        
        for i in 0..<rows {
            for j in 0..<columns {
                matrix[i][j] = Double.random(in: 0...1)
            }
        }
    }
    
    func feedForward(vector: [Double]) -> [Double] {
        let vector = vector + [bias]
        lastInput = vector
        
        var output = [Double](repeating: 0.0, count: rows)
        for i in 0..<rows {
            var sum = 0.0
            for j in 0..<columns {
                sum += matrix[i][j] * vector[j]
            }
            output[i] = sum
        }
        lastSums = output

        return activation.call(x: output)
    }
    
    func backPropagate(vector: [Double], learningRate: Double) -> [Double] {
        let activationGradient = activation.gradient(x: lastSums)
        var inputGradient = [Double](repeating: 0.0, count: columns)
        
        for i in 0..<columns {
            var derivative = 0.0
            for j in 0..<rows {
                derivative += matrix[j][i] * vector[j] * activationGradient[j]
            }
            inputGradient[i] = derivative
        }
        
        for i in 0..<rows {
            for j in 0..<columns {
                let partial = vector[i] * activationGradient[i] * lastInput[j]
                matrix[i][j] = matrix[i][j] - partial * learningRate
            }
        }
        
        return inputGradient
    }
}
