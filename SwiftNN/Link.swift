//
//  Link.swift
//  SwiftNN
//
//  Created by PointerFLY on 29/12/19.
//  Copyright © 2019 PointerFLY. All rights reserved.
//

import Foundation

class Link {
    
    var valueChanged: ((Float) -> Void)?
    
    var weight: Float = 0.0

    var value: Float = 0.0 {
        didSet {
            valueChanged?(value)
        }
    }
}

class OutLinkGroup {
    
    private var links = [Link]()
    
    func addLink(_ link: Link) {
        links.append(link)
    }
    
    func forward(_ value: Float) {
        for link in links {
            link.value = value
        }
    }
}

class InLinkGroup {
    
    private var links = [Link]()
    private var valueChangedLinkCount = 0
    
    var linksAreReady: (([Float]) -> Void)?
    
    func addLink(_ link: Link) {
        links.append(link)
        
        link.valueChanged = { [weak self] value in
            guard let me = self else { return }
            
            // TODO: Need to use other way
            me.valueChangedLinkCount += 1
            if me.valueChangedLinkCount == me.links.count {
                me.valueChangedLinkCount = 0
                me.linksAreReady?(me.links.map { $0.value })
            }
        }
    }
}
