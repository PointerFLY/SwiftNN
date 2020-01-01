//
//  Activation.swift
//  SwiftNN
//
//  Created by PointerFLY on 29/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

protocol Activation {
    
    func call(_ x: Float) -> Float
    
    func derivative(x: Double) -> Double
}

class Relu: Activation {
    
    func call(_ x: Float) -> Float {
        return max(x, 0.0)
    }
    
    func derivative(x: Double) -> Double {
        return x < 0 ? 0 : x
    }
}

class Echo: Activation {
    
    func call(_ x: Float) -> Float {
        return x
    }
    
    func derivative(x: Double) -> Double {
        return 1.0
    }
}

class Sigmoid: Activation {
    
    static let e: Float = 2.71828182845904523536
    
    func call(_ x: Float) -> Float {
        return 1.0 / (1 + pow(Sigmoid.e, -x))
    }
    
    func derivative(x: Double) -> Double {
        return 1.0
    }
}
