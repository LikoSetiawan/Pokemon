//
//  MovesCardView.swift
//  Pokemon
//
//  Created by Liko Setiawan on 02/05/24.
//

import SwiftUI

struct MovesCardView: View {
    var movesLink = ""
    @State private var movesTypes = ""
    
    
    var body: some View {
            Text(movesTypes.capitalized)
                .padding(8)
                .foregroundColor(.white)
                .background(typeColors[movesTypes])
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .task {
                    await getMoveTypes()
                }
     
        
    }
    
    func getMoveTypes() async {
            guard let url = URL(string: movesLink) else { return }
            
            do {
                let (data, _ ) = try await URLSession.shared.data(from: url)
                let decodedMovesData = try JSONDecoder().decode(PokemonMoveLink.self, from: data)
                movesTypes = decodedMovesData.type.name
//                print(movesTypes)
                
            } catch {
                
            }
        
    }
    
    
}

#Preview {
    MovesCardView()
        .previewLayout(.sizeThatFits)
}



