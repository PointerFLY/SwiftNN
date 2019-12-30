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

    private(set) var lastOutput: Float = 0
    private let activation: Activation
    private var inLinks = [Link]()
    private var outLinks = [Link]()
    
    init(activation: Activation) {
        self.activation = activation
    }
    
    func acceptInLink(_ link: Link) {
        inLinks.append(link)
    }
    
    func outLinkTo(_ inLinkable: InLinkable) {
        let link = Link()
        inLinkable.acceptInLink(link)
        outLinks.append(link)
    }
}
