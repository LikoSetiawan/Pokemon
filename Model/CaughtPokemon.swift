//
//  CaughtPokemon.swift
//  Pokemon
//
//  Created by Liko Setiawan on 05/05/24.
//

import Foundation


struct CaughtPokemon: Codable, Identifiable {
    var id: UUID
    var name: String
    var pokeball: String
    
    static let example = CaughtPokemon(id: UUID(), name: "pup", pokeball: "Master ball")
    
}
