//
//  PokemonImage.swift
//  Pokemon
//
//  Created by Liko Setiawan on 28/03/24.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 75, height: 75)

            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
            .scaledToFit()
            .task {
                await getSprite()
            }
        
    }
    
    func getSprite() async {
        guard let url = URL(string: imageLink) else {
            print("invalid url")
            return }
        
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedSprites = try? JSONDecoder().decode(PokemonSelected.self, from: data){
                if let frontDefault = decodedSprites.sprites.front_default {
                    pokemonSprite = frontDefault
                }
                
                
            }
            
        } catch {
            print("Invalid URL")
        }
        
        }
}

#Preview {
    PokemonImage()
//        .previewInterfaceOrientation(.portrait)
}


//tempSprite = sprite.front_default
//self.pokemonSprite = tempSprite ?? "placeholder"
