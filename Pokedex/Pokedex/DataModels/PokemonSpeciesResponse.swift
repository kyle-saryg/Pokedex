//
//  PokemonSpeciesResponse.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/28/23.
//

import Foundation

struct PokemonSpeciesResponse: Codable {
    let evolution_chain: EvolutionChainDetails
    let evolves_from_species: SpeciesDetail? // Null if base form, returns species url otherwise
    let flavor_text_entries: [TextEntry]
    
    struct EvolutionChainDetails: Codable {
        let url: String
    }
    
    struct SpeciesDetail: Codable {
        let name: String
        let url: String
    }
    
    struct TextEntry: Codable {
        let flavor_text: String
    }
}
