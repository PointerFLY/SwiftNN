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
        
        let row = [Double](repeating: 0, count: inputSize)
        matrix = [[Double]](repeating: row, count: outputSize)
        
        for i in 0..<outputSize {
            for j in 0..<inputSize {
                matrix[i][j] = Double.random(in: 0...1)
            }
        }
    }
    
    func feedForward(vector: [Double]) -> [Double] {
        lastInput = vector
        var newVector = [Double]()
        lastSums.removeAll()
        for row in matrix {
            var sum = 0.0
            for i in 0..<row.count {
                sum += row[i] * vector[i]
            }
            lastSums.append(sum)
            newVector.append(activation.call(sum))
        }

        return newVector
    }
    
    func backPropagate(vector: [Double]) -> [Double] {
        let learningRate = 0.001
        var newVector = [Double]()
        
        for i in 0..<matrix.count {
            let element = vector[i]
            for j in 0..<matrix[0].count {
                let partial = element * activation.derivative(x: lastSums[i]) * lastInput[j]
                matrix[i][j] = matrix[i][j] - partial * learningRate
            }
        }
        
        for i in 0..<matrix[0].count {
            var loss = 0.0
            for j in 0..<matrix.count {
                loss += matrix[j][i] * vector[j]
            }
            newVector.append(loss)
        }
        
        return newVector
    }
}
