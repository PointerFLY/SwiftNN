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
}


class Relu: Activation {
    
    func call(_ x: Float) -> Float {
        return max(x, 0.0)
    }
}

class Echo: Activation {
    
    func call(_ x: Float) -> Float {
        return x
    }
}

class Sigmoid: Activation {
    
    static let e: Float = 2.71828182845904523536
    
    func call(_ x: Float) -> Float {
        return 1.0 / (1 + pow(Sigmoid.e, -x))
    }
}
