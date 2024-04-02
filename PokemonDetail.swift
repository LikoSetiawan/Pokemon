//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Liko Setiawan on 28/03/24.
//

import SwiftUI

struct PokemonDetail: View {
    
    let pokemon: PokemonEntry
    
    @State private var pokemonType: String = "Loading,..."
    
    
//    init(pokemon: PokemonEntry, pokemonType: Binding<String>) {
//            self.pokemon = pokemon
//            self._pokemonType = pokemonType
//
//        }
    
    var body: some View {
        ScrollView {
            VStack {
                // Display the Pokemon image
                PokemonImage(imageLink: "\(pokemon.url)")
//                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.black)
                    .padding(.vertical)
                
                // Display the Pokemon name
                Text(pokemon.name.capitalized)
                    .font(.title)
                    .padding(.bottom)
                
//                Text()
                
                // Other details about the Pokemon
                Text("Type: \(pokemonType)")
                    .font(.headline)
                    .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Abilities:")
                        .font(.headline)
                    
                    Text("- Overgrow")
                        .foregroundColor(.secondary)
                }
                .padding(.bottom)
                
                // Add more details as needed
            }
            .padding()
        }
        .navigationTitle("Pokemon Detail")
        .onAppear {
            getType()
        }
    }
    
    func getType(){
        PokemonSelectedApi().getType(url: pokemon.url){ type in
//            print("Fetched Pokémon type: \(type.type.name)")
            let typeNames = type.map { $0.type.name }
            self.pokemonType = typeNames.joined(separator: ", ")
            
        }
    }
    
}

#Preview {
    PokemonDetail(pokemon : PokemonEntry(name: "Bulba", url: "dummy.com"))
}
