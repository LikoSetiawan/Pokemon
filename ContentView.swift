////
////  ContentView.swift
////  Pokemon
////
////  Created by Liko Setiawan on 27/03/24.
////
import SwiftUI

struct ContentView: View {
    
    @State private var pokemons = [Pokemon]()
    
    var body: some View {
        NavigationStack {
            List(pokemons, id: \.self) { pokemon in
                NavigationLink(value: pokemon){
                    HStack{
                        PokemonImage(imageLink: pokemon.url)
                        Text(pokemon.name.capitalized)
                        
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
        }
      
    }
    
    func fetchPokemons() async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
//            print(data)
            if let decodedData = try? JSONDecoder().decode(PokemonEntry.self, from: data){
                pokemons = decodedData.results
//                print(pokemons)
            }
            
        } catch{
            print("download failed")
        }
    }
    
//    func fetchPokemonData() async{
//        guard let url = URL(string: pokemon.url)
//    }
}

#Preview {
    ContentView()
}
