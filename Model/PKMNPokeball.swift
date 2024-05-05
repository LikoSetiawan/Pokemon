//
//  PKMNPokeball.swift
//  Pokemon
//
//  Created by Liko Setiawan on 04/05/24.
//

import Foundation

struct PKMNPokeItem: Codable {
    var results: [PKMNItemBalls]
}

struct PKMNItemBalls: Codable, Hashable {
    var name: String
    var url: String
    
    static let example = PKMNItemBalls(name: "Master-Ball", url: "Master-ball-url")
}
