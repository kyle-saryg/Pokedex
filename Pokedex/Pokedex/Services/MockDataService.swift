//
//  MockDataService.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

struct MockDataService: DataService {
    static var testPokemon: Pokemon {
        let response: PokeAPIResponse = try! Bundle.main.decode("6.json")
        
        let abilities: [String] = response.abilities.map { $0.ability.name }
        let moves: [String] = response.moves.map { $0.move.name }
        let types: [String] = response.types.map { $0.type.name }
        
        let pokemon: Pokemon = Pokemon(id: response.id, name: response.name.capitalizeFirstLetter(), abilities: abilities, baseExperience: response.base_experience, heigh: response.height, moves: moves, species: response.species.url, sprites: response.sprites, types: types, weight: response.weight)
        return pokemon
    }
    
    func getPokemon(id: Int) async throws -> Pokemon {
        do {
            let response: PokeAPIResponse = try Bundle.main.decode("\(id).json")
            
            let abilities: [String] = response.abilities.map { $0.ability.name }
            let moves: [String] = response.moves.map { $0.move.name }
            let types: [String] = response.types.map { $0.type.name }
            
            let pokemon: Pokemon = Pokemon(id: response.id, name: response.name.capitalizeFirstLetter(), abilities: abilities, baseExperience: response.base_experience, heigh: response.height, moves: moves, species: response.species.url, sprites: response.sprites, types: types, weight: response.weight)
            return pokemon
        } catch {
            throw error
        }
    }
}
