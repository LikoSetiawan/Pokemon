//
//  PokeMoveData.swift
//  Pokemon
//
//  Created by Liko Setiawan on 02/05/24.
//

import Foundation

struct PokemonMoveLink: Codable {
    var type: MoveType
}

struct MoveType: Codable {
    var name: String
}
