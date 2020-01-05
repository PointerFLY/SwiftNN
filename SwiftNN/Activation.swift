//
//  Activation.swift
//  SwiftNN
//
//  Created by PointerFLY on 29/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

protocol Activation {
    
    func call(_ x: Double) -> Double
    
    func derivative(x: Double) -> Double
}

class Relu: Activation {
    
    func call(_ x: Double) -> Double {
        return max(x, 0.0)
    }
    
    func derivative(x: Double) -> Double {
        return x < 0 ? 0 : 1
    }
}

class Echo: Activation {
    
    func call(_ x: Double) -> Double {
        return x
    }
    
    func derivative(x: Double) -> Double {
        return 1.0
    }
}
