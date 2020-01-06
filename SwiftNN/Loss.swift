//
//  Loss.swift
//  SwiftNN
//
//  Created by PointerFLY on 1/1/20.
//  Copyright © 2020 PointerFLY. All rights reserved.
//

import Foundation

protocol Loss {
    
    func call(y: [Double], label: [Double]) -> Double
    
    func gradient(y: [Double], label: [Double]) -> [Double]
}

class RMSE: Loss {
    
    func call(y: [Double], label: [Double]) -> Double {
        var error = 0.0
        for i in 0..<y.count {
            error += pow(abs(y[i] - label[i]), 2)
        }
        
        error = sqrt(error / Double(y.count))
        return error
    }
    
    func gradient(y: [Double], label: [Double]) -> [Double] {
        var gradient = [Double]()
        for i in 0..<y.count {
            let derivative = (y[i] - label[i])
            gradient.append(derivative)
        }
        
        return gradient
    }
}

class MAE: Loss {
    
    func call(y: [Double], label: [Double]) -> Double {
        var error = 0.0
        for i in 0..<y.count {
            error += abs(y[i] - label[i])
        }
        
        error = error / Double(y.count)
        return error
    }
    
    func gradient(y: [Double], label: [Double]) -> [Double] {
        var gradient = [Double]()
        for i in 0..<y.count {
            let derivative = y[i] > label[i] ? 1.0 : -1.0
            gradient.append(derivative)
        }
        
        return gradient
    }
}
