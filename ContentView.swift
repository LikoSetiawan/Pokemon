////
////  ContentView.swift
////  Pokemon
////
////  Created by Liko Setiawan on 27/03/24.
////
import SwiftUI

struct ContentView: View {
    
    @State private var pokemons = [Pokemon]()
    @State private var favorites = Favorites()
    @State private var isShowingListPokemon = false
    
    @State private var caughtViewModel = PKMNcaughtViewModel()
    
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                NavigationLink(value: pokemon){
                    HStack{
                        PokemonImage(imageLink: pokemon.url)
                        Text(pokemon.name.capitalized)
                        
                        if favorites.contains(pokemon) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Pokemon")
            .navigationDestination(for: Pokemon.self){ pokemon in
                PokemonDetail(pokemon: pokemon)
            }
            .task {
                await fetchPokemons()
            }
            .toolbar {
                Button("My Pokemon List") {
                    isShowingListPokemon.toggle()
                }
                .buttonStyle(.plain)
                .shadow(color: Color.black.opacity(0.4), radius: 3, x: 0, y: 2)
            }
            .sheet(isPresented: $isShowingListPokemon) {
                MyPokemonListView(caughtViewModels: caughtViewModel)
            }
           
        }
        .environment(favorites)
      
    }
    
    func fetchPokemons() async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode(PokemonEntry.self, from: data){
                pokemons = decodedData.results
            }
            
        } catch{
            print("download failed")
        }
    }
    
}

#Preview {
    ContentView()
}
