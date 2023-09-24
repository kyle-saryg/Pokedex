//
//  NetworkDataService.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

struct NetworkDataService: DataService {
    func getPokemon(id: Int) async throws -> Pokemon {
        do {
            let response: PokeAPIResponse = try await queryAPI(url: "https://pokeapi.co/api/v2/pokemon/\(id)")
            
            let abilities: [String] = response.abilities.map { $0.ability.name }
            let moves: [String] = response.moves.map { $0.move.name }
            let types: [String] = response.types.map { $0.type.name }
            
            let pokemon: Pokemon = Pokemon(id: response.id, name: response.name.capitalizeFirstLetter(), abilities: abilities, baseExperience: response.base_experience, heigh: response.height, moves: moves, species: response.species.url, sprites: response.sprites, types: types, weight: response.weight)
            
            return pokemon
        } catch {
            throw error
        }
    }
    
    func queryAPI<T: Codable>(url urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.InvalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
}
