//
//  ContentView.swift
//  Pokemon
//
//  Created by Liko Setiawan on 27/03/24.
//

import SwiftUI

struct Response: Codable{
    var results : [Pokemon]
    
}

struct Pokemon: Codable{
    var name : String
    var url : String
    var sprites : Sprites?
}

struct Sprites: Codable{
    var frontDefault : String?
}


struct ContentView: View {
    
    @State private var pokemons = [Pokemon]()

    var body: some View {
        List(pokemons, id: \.name){item in
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text(item.url)
            }
            
        }
        .task {
            await loadData()
        }
    }
    func loadData() async{
        //https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0 all of pokemon
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/") else{
            print("invalid URL")
            return
        }
        
        do{
            //fetch the pokemon list using url
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from : data){
                pokemons = decodedResponse.results
                
                for var pokemon in pokemons {
                    if let pokemonURL = URL(string: pokemon.url){
                        let (pokemonData, _) = try await URLSession.shared.data(from: pokemonURL)
                        let pokemonDetail = try JSONDecoder().decode(Sprites.self, from: pokemonData)
                        print("Fetching data for: \(pokemon.name), URL: \(pokemonDetail.frontDefault)")
                        pokemon.sprites = pokemonDetail
                        

                    }
                }
                
            }

        }catch{
            print("invalid data")
        }
    }
}

#Preview {
    ContentView()
}
