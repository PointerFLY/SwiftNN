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
    private var lastInput = [Double]()
    private var lastSums = [Double]()
    
    init(inputSize: Int, outputSize: Int, activation: Activation) {
        self.inputSize = inputSize
        self.outputSize = outputSize
        self.activation = activation
        
        let row = [Double](repeating: 0, count: inputSize + 1) // Plus one for bias
        matrix = [[Double]](repeating: row, count: outputSize)
        
        for i in 0..<outputSize {
            for j in 0..<(inputSize + 1) {
                matrix[i][j] = Double.random(in: 0...1)
            }
        }
    }
    
    func feedForward(vector: [Double]) -> [Double] {
        var vector = vector
        vector.append(1.0) // Bias
        lastInput = vector
        
        var newVector = [Double]()
        lastSums.removeAll()
        for row in matrix {
            var sum = 0.0
            for i in 0..<row.count {
                sum += row[i] * vector[i]
            }
            lastSums.append(sum)
            newVector.append(sum)
        }
        

        return activation.call(x: newVector)
    }
    
    func backPropagate(vector: [Double], learningRate: Double) -> [Double] {
        var newVector = [Double]()
        
        let actGradient = activation.gradient(x: lastSums)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                let partial = vector[i] * actGradient[i] * lastInput[j]
                matrix[i][j] = matrix[i][j] - partial * learningRate
            }
        }
        
        for i in 0..<matrix[0].count {
            var loss = 0.0
            for j in 0..<matrix.count {
                loss += matrix[j][i] * vector[j] * actGradient[j]
            }
            newVector.append(loss)
        }
        
        return newVector
    }
}
