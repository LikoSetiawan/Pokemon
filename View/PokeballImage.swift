//
//  PokeballImage.swift
//  Pokemon
//
//  Created by Liko Setiawan on 04/05/24.
//

import SwiftUI

struct PokeballImage: View {
    var imageLink = ""
    @State private var pokeballSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokeballSprite)) { image in
            image.resizable()
                .interpolation(.none)
        } placeholder: {
            ProgressView()
        }
        .frame(width: 75, height: 75)
        .clipShape(Circle())
        .foregroundColor(Color.gray.opacity(0.60))
        .scaledToFit()
        .task {
            await getPokeballSprite()
        }
    }
    
    func getPokeballSprite() async {
        guard let url = URL(string: imageLink) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedPokeballSprite = try JSONDecoder().decode(PKMNItemData.self, from: data)
            pokeballSprite = decodedPokeballSprite.sprites.default
            
            
        } catch {
            print("Error to load pokeball sprite")
            
        }
        
    }
    
}

#Preview {
    PokeballImage()
}
