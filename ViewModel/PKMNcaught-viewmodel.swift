//
//  PKMNcaught-viewmodel.swift
//  Pokemon
//
//  Created by Liko Setiawan on 05/05/24.
//

import Foundation
import SwiftUI

@Observable
class PKMNcaughtViewModel {
    
    var caughtPokemon = [CaughtPokemon]()
    
    private let key = "CaughtPKMN"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode([CaughtPokemon].self, from: data) {
                caughtPokemon = decoded
                print("\(caughtPokemon)")
                return
            }
        }
        
        caughtPokemon = []
    }
    
    
    func add(name: String, pokeball: String) {
        let newPokemon = CaughtPokemon(id: UUID(), name: name, pokeball: pokeball)
        caughtPokemon.append(newPokemon)
        save()
        print("Pokemon caught and saved successfully. \(caughtPokemon)")
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(caughtPokemon) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
}
