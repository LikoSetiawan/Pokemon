//
//  Sprite.swift
//  Pokemon
//
//  Created by Liko Setiawan on 28/03/24.
//
import Foundation

struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    var weight: Int
    var types : [PokemonType]
}

struct PokemonSprites : Codable {
    var front_default: String?
}

struct PokemonType : Codable{
    var type : TypeName
}

struct TypeName : Codable{
    var name : String
}

class PokemonSelectedApi  {
    
    
    func getSprite(url: String, completion:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
    
    func getType(url: String, completion: @escaping ([PokemonType]) -> Void) {
        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error fetching Pokémon type:", error?.localizedDescription ?? "Unknown error")
                return
            }

            do {
                let pokemonType = try JSONDecoder().decode(PokemonSelected.self, from: data)
                if let firstType = pokemonType.types.first {
                    completion(pokemonType.types)
                } else {
                    print("No type found for Pokémon")
                }
            } catch {
                print("Error decoding Pokémon type:", error)
            }
        }.resume()
    }
    
//    func getType(url: String, completion:@escaping (PokemonType) -> ()){
//        guard let url = URL(string: url) else { return }
//        
//        URLSession.shared.dataTask(with: url) {(data, response, error) in
//            guard let data = data else { return }
//            
//            let pokemonType = try! JSONDecoder().decode(PokemonSelected.self, from: data)
//            
//            DispatchQueue.main.async{
//                if let firstType = pokemonType.types.first{
//                    completion(firstType)
//                }
//            }
//            
//        }
//    }
    
}
