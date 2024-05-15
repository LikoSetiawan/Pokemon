//
//  PokeballsView.swift
//  Pokemon
//
//  Created by Liko Setiawan on 04/05/24.
//

import SwiftUI

struct PokeballsView: View {
    @State private var pokeballs = [PKMNItemBalls]()
    @State private var caughtViewModel = PKMNcaughtViewModel()
    let pokemon: Pokemon
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    @State private var isAlertShow = false
    @State private var catchResult : String?
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(pokeballs, id: \.self) { pokeball in
                        Button() {
                            catchResult = catchPokemon(pokeball: pokeball)
                            isAlertShow.toggle()
                            if let catchResult = catchResult {
                                caughtViewModel.add(name: pokemon.name, pokeball: catchResult)
                            }
                        } label : {
                            VStack{
                                PokeballImage(imageLink: pokeball.url)
                                Text(pokeball.name.replacingOccurrences(of: "-", with: " ").capitalized)
                                    .font(.subheadline.bold())
                            }
                            .frame(width: 110)
                            .background(Color(hex: 0xEDF7FF))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            
                            
                        }
                        .padding(.horizontal)
                        .buttonStyle(.plain)
                        .alert(isPresented: $isAlertShow) {
                            Alert(title: Text("catch result"),message: Text(catchResult ?? ""), dismissButton: .default(Text("OK")))
                        }
                    }
                    
                }
                
                
            }
            .navigationTitle("Select Pokeball To Catch \(pokemon.name.capitalized)")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await fetchPokeballItem()
        }
    }
    
    func fetchPokeballItem() async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/item/?offset=0&limit=16") else { return }
        
        do {
            let (data, _ ) = try await URLSession.shared.data(from: url)
            let decodedPKMNItem = try? JSONDecoder().decode(PKMNPokeItem.self, from: data)
            
            pokeballs = decodedPKMNItem!.results
            
        } catch {
            print("download failed")
            
        }
        
    }
    
    func catchPokemon(pokeball: PKMNItemBalls) -> String {
        if pokeball.name == "master-ball" {
            return "Catch successful! You caught the pokemon using masterball!"
        } else {
            let catchSuccess = Bool.random()
            return catchSuccess ? "catch successful using \(pokeball.name)" : "Failed to catch"
        }
    }
    
    
}

#Preview {
    PokeballsView(pokemon: .example)
}
