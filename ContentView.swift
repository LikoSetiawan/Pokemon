////
////  ContentView.swift
////  Pokemon
////
////  Created by Liko Setiawan on 27/03/24.
////
import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var selectedPokemon: PokemonEntry? = nil
    
    var body: some View {
        NavigationStack {
            List(pokemon) { entry in
                HStack {
                    PokemonImage(imageLink: "\(entry.url)")
                        .padding(.trailing, 20)
                    NavigationLink("\(entry.name)".capitalized, destination: PokemonDetail(pokemon: entry))
                        .onTapGesture { 
                            selectedPokemon = entry
                        }
                    
                    VStack{
//                        Text(entry.)
                    }
                }
            
            }
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .navigationTitle("Pokemon")
        }
    }
}

#Preview {
    ContentView()
}
