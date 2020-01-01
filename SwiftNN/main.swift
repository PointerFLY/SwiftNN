//
//  main.swift
//  SwiftNN
//
//  Created by PointerFLY on 28/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

let model = Model()

let layer1 = Layer(inputSize: 3, outputSize: 4, activation: Relu())
let layer2 = Layer(inputSize: 4, outputSize: 4, activation: Relu())
let layer3 = Layer(inputSize: 4, outputSize: 3, activation: Relu())
let layer4 = Layer(inputSize: 3, outputSize: 1, activation: Relu())

model.addLayer(layer1)
model.addLayer(layer2)
model.addLayer(layer3)
model.addLayer(layer4)

let output = model.predict([3, 3, 3])
print(output)

