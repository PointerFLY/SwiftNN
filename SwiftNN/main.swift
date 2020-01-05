//
//  main.swift
//  SwiftNN
//
//  Created by PointerFLY on 28/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

let model = Model()
model.addLayer(Layer(inputSize: 1, outputSize: 4, activation: Relu()))
model.addLayer(Layer(inputSize: 4, outputSize: 4, activation: Relu()))
model.addLayer(Layer(inputSize: 4, outputSize: 1, activation: Relu()))

print(model.predict(x: [3.5]))

let xList: [[Double]] = [[1], [2], [3], [4], [5]]
let labels: [[Double]] = [[2], [4], [6], [8], [10]]
model.train(xList: xList, labels: labels, loss: RMSE(), iteration: 10)

print(model.predict(x: [3.5]))
print(model.predict(x: [14]))
