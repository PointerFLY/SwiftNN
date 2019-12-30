//
//  main.swift
//  SwiftNN
//
//  Created by PointerFLY on 28/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

let in1 = Link()
let in2 = Link()

let n1 = Neuron(activation: Relu())
let n2 = Neuron(activation: Relu())

n1.acceptInLink(in1)
n1.acceptInLink(in2)
n2.acceptInLink(in1)
n2.acceptInLink(in2)

class OutputUnit: InLinkable {
    
    var link: Link? = nil
    
    func acceptInLink(_ link: Link) {
        self.link = link
    }
}

let out1 = OutputUnit()
let out2 = OutputUnit()

n1.outLinkTo(out1)
n2.outLinkTo(out2)

out1.link?.valueChanged = { value in
    print(value)
}
out2.link?.valueChanged = { value in
    print(value)
}

in1.value = 3
in2.value = 4
