//
//  Sprite.swift
//  Pokemon
//
//  Created by Liko Setiawan on 28/03/24.
//
import Foundation

struct PokemonSelected : Codable {
    var sprites: Sprites
    var types: [PokemonType]
    var moves: [PokemonMove]

}

struct Sprites : Codable {
    var front_default: String?
    var back_default : String?
    var other : SpriteOthers
}

struct SpriteOthers: Codable{
    var home: Home
    var showdown : Showdown
}

struct Home: Codable {
    var front_default: String?
}

struct Showdown: Codable{
    var front_shiny : String?
}

struct PokemonType: Codable{
    var type : Type
}

struct Type: Codable {
    var name : String
}



struct PokemonMove: Codable{
    var move: Move
}

struct Move: Codable{
    var name: String
    var url: String
    
    
}



