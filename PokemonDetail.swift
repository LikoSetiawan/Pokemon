//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Liko Setiawan on 28/03/24.
//

import SwiftUI

struct PokemonDetail: View {
    
    let pokemon: PokemonEntry
    
    var body: some View {
        ScrollView {
            VStack {
                // Display the Pokemon image
                Image(systemName: "photo")
                    .resizable()
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
                
                // Other details about the Pokemon
                Text("Type: Grass")
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
    }
}

#Preview {
    PokemonDetail(pokemon : PokemonEntry(name: "Bulba", url: "dummy.com"))
}
