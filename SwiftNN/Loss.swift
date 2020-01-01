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
    
    func derivative(y: [Double], label: [Double], yi: Double, labeli: Double) -> Double
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
    
    func derivative(y: [Double], label: [Double], yi: Double, labeli: Double) -> Double {
        return 1.0
    }
}

