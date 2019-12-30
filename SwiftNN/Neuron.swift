//
//  Neuron.swift
//  SwiftNN
//
//  Created by PointerFLY on 28/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

protocol InLinkable {
    func acceptInLink(_ link: Link)
}

protocol OutLinkable {
    func outLinkTo(_ inLinkable: InLinkable)
}

class Neuron: InLinkable, OutLinkable {

    private let activation: Activation
    private let inLinkGroup = InLinkGroup()
    private let outLinkGroup = OutLinkGroup()
    
    init(activation: Activation) {
        self.activation = activation
        
        inLinkGroup.linksAreReady = { [weak self] values in
            guard let me = self else { return }
            let sum = values.reduce(0.0, +)
            let value = activation.call(sum)
            me.outLinkGroup.forward(value)
        }
    }
    
    func acceptInLink(_ link: Link) {
        inLinkGroup.addLink(link)
    }
    
    func outLinkTo(_ inLinkable: InLinkable) {
        let link = Link()
        inLinkable.acceptInLink(link)
        outLinkGroup.addLink(link)
    }
}
