//
//  MyPokemonListView.swift
//  Pokemon
//
//  Created by Liko Setiawan on 04/05/24.
//

import SwiftUI

struct MyPokemonListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var caughtPokemons = [CaughtPokemon]()
    
    
    var body: some View {
        NavigationStack{
            List(caughtPokemons) { item in
                Text(item.name)
                
                
            }
            .navigationTitle("My Pokemon")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Back")
                        
                    }
                }
            }
        }
    }
}

#Preview {
    MyPokemonListView()
}
