//
//  Favorites.swift
//  Pokemon
//
//  Created by Liko Setiawan on 05/05/24.
//


import SwiftUI

@Observable
class Favorites {
    private var pokemons: Set<String>
    
    private let key = "Favorites"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data){
                pokemons = decoded
                return
            }
        }
        
        pokemons = []
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(pokemons) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func contains(_ pokemon: Pokemon) -> Bool {
        pokemons.contains(pokemon.id)
    }
    
    func add(_ pokemon: Pokemon) {
        pokemons.insert(pokemon.id)
        save()
    }
    
    func remove(_ pokemon: Pokemon) {
        pokemons.remove(pokemon.id)
        save()
    }
    
}
