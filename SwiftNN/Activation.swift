//
//  Activation.swift
//  SwiftNN
//
//  Created by PointerFLY on 29/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

protocol Activation {
    
    func call(x: [Double]) -> [Double]
    
    func gradient(x: [Double]) -> [Double]
}

class Relu: Activation {
    
    func call(x: [Double]) -> [Double] {
        return x.map { max($0, 0.0) }
    }
    
    func gradient(x: [Double]) -> [Double] {
        return x.map { $0 < 0 ? 0 : 1 }
    }
}

class Sigmoid: Activation {
    
    func call(x: [Double]) -> [Double] {
        return x.map { 1.0 / (1 + exp(-$0)) }
    }
    
    func gradient(x: [Double]) -> [Double] {
        return call(x: x).map { $0 * (1 - $0) }
    }
}

class Echo: Activation {
    func call(x: [Double]) -> [Double] {
        return x
    }
    
    func gradient(x: [Double]) -> [Double] {
        return x.map { _ in 1.0 }
    }
}
