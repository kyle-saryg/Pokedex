//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/21/23.
//

import Foundation

struct PokeAPIResponse: Codable, Identifiable {
    let id: Int
    let name: String
    let abilities: [Ability]
    let base_experience: Int
    let height: Int
    let moves: [Move]
    let species: Species
    let sprites: Sprite
    let types: [Type]
    let weight: Int
    
    struct Ability: Codable {
        let ability: AbilityDetail
        
        struct AbilityDetail: Codable {
            let name: String
            let url: String
        }
    }
    
    struct Move: Codable {
        let move: MoveDetail
        
        struct MoveDetail: Codable {
            let name:  String
            let url: String
        }
    }
    
    struct Species: Codable {
        let url: String
    }
    
    struct Sprite: Codable {
        let back_default: String
        let front_default: String
    }
    
    struct `Type`: Codable {
        let type: TypeDetail
        
        struct TypeDetail: Codable {
            let name: String
        }
    }
}
