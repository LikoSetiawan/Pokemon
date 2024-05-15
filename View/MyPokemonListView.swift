//
//  MyPokemonListView.swift
//  Pokemon
//
//  Created by Liko Setiawan on 04/05/24.
//

import SwiftUI

struct MyPokemonListView: View {
    @Environment(\.dismiss) var dismiss
    
    
    var caughtViewModels: PKMNcaughtViewModel
    
    
    var body: some View {
        NavigationStack{
            List(caughtViewModels.caughtPokemon) { item in
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
    MyPokemonListView(caughtViewModels: PKMNcaughtViewModel())
}
