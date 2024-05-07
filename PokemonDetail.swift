//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Liko Setiawan on 28/03/24.
//

import SwiftUI

struct PokemonDetail: View {
    let pokemon: Pokemon
    @Environment(Favorites.self) var favorites
    
    @State private var pokemonDefaultSprite = ""
    @State private var pokemonTypes = [String]()
    
    @State private var movesInfo = [Move]()
    
    @State private var isShowingPokeballs = false
    
    let columns = [
        GridItem(.fixed(165)),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    ZStack {
                        Color(hex: 0xEDF7FF)
                            .frame(width: proxy.size.width, height: proxy.size.height * 0.4)
                        VStack{
                            Spacer()
                            Spacer()
                            HStack(spacing: 12){
                                ForEach(pokemonTypes, id: \.self) { type in
                                    Text(type.capitalized)
                                        .padding(10)
                                        .foregroundStyle(.white)
                                        .font(.headline.bold())
                                        .background(typeColors[type])
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding()
                            .padding(.bottom, -90)
                           
                            Spacer()
                            
                            AsyncImage(url: URL(string: pokemonDefaultSprite)){ image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                                
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 200, height: 200)
                                
                            }
                            .padding(.bottom, -50)
                        }
                    }
                    Rectangle()
                        .frame(height: 5)
                        .foregroundStyle(.white)
                        .padding(.vertical, 35)
                        
                    
                    Text("Moves")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .font(.title.bold())
                        
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(movesInfo, id: \.name) { move in
                            VStack {
                                Text(move.name.capitalized)
                                MovesCardView(movesLink: move.url)
                                    
                            }
                            .frame(width: 150, height: 80)
                            .background(Color(hex: 0xd5dee5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                        }
                    }
                    .padding()
                    
                    Button("Catch This Pokemon") {
                        print("It has to be 50 50 change to get the pokemon")
                        isShowingPokeballs.toggle()
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    
                    
                    
                    
                    
                    
                }
            }
            
            
        }
        .navigationTitle(pokemon.name.capitalized)
        .ignoresSafeArea()
        .sheet(isPresented: $isShowingPokeballs) {
            PokeballsView()
                .presentationDetents([.height(300)])
        }
        .task {
            await getPokemonInfo()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add to Favorites", systemImage: "heart.fill") {
                    if favorites.contains(pokemon) {
                        favorites.remove(pokemon)
                    } else {
                        favorites.add(pokemon)
                    }
                }
                .buttonStyle(.plain)
                .foregroundStyle(favorites.contains(pokemon) ? .red : .gray)
                
            }
        }
    }
    
    func getPokemonInfo() async {
        guard let url = URL(string: pokemon.url) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedPokemon = try? JSONDecoder().decode(PokemonSelected.self, from: data) {
                
                // Get Pokemon Types
                pokemonTypes = decodedPokemon.types.map { $0.type.name }
                
                // Get Sprites
                if let frontDefault = decodedPokemon.sprites.other.home.front_default {
                    pokemonDefaultSprite = frontDefault
                }
                
                // Get Pokemon Moves and their URL
                movesInfo = decodedPokemon.moves.prefix(4).map {
                    move in
                    let moveName = move.move.name.replacingOccurrences(of: "-", with: " ")
                    return Move(name: moveName, url: move.move.url)
                    
                }
//                print(movesInfo)
                
                
                
            }
            
        } catch {
            print("failed to fetch pokemon details : \(error.localizedDescription)")
        }
        
    }
    
}

#Preview {
    PokemonDetail(pokemon: .example)
        .environment(Favorites())
}


// Elsys (wa.me/6285163544100


