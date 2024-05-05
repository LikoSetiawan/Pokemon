//
//  MyPokemonListView.swift
//  Pokemon
//
//  Created by Liko Setiawan on 04/05/24.
//

import SwiftUI

struct MyPokemonListView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Text("this should be your pokemon list")
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
