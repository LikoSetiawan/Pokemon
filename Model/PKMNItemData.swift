//
//  PKMNItemData.swift
//  Pokemon
//
//  Created by Liko Setiawan on 04/05/24.
//

import Foundation


struct PKMNItemData: Codable {
    var sprites: PKMNItemSprite
    
}

struct PKMNItemSprite: Codable {
    var `default`: String
}
