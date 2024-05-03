//
//  Pokemon.swift
//  Pokemon
//
//  Created by Liko Setiawan on 28/03/24.
//

import Foundation

struct PokemonEntry: Codable {
    var results : [Pokemon]
}

struct Pokemon: Codable, Hashable{
//    let id: UUID
    var name : String
    var url : String
    
    static let example = Pokemon(name: "Bulbasaur", url: "Pokeapibulsaur")
}


//
//
//                Rectangle()
//                    .frame(height: 2)
//                    .foregroundStyle(.black)
//                    .padding(.vertical)
//
//                // Display the Pokemon name
//                Text(pokemon.name.capitalized)
//                    .font(.title)
//
//                // Other details about the Pokemon
//                Text("Type: \(pokemonTypes)")
//                    .font(.headline)
//                    .padding(.bottom)
//
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Abilities:")
//                        .font(.headline)
//
//                    Text("- Overgrow")
//                        .foregroundColor(.secondary)
//                }
//                .padding(.bottom)

// Add more details as needed
