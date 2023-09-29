//
//  NetworkDataService.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

struct NetworkDataService: DataService {
    
    func getSpeciesInfo(url: String) async throws -> PokemonSpeciesResponse {
        do {
            return try await queryAPI(url: url)
        } catch {
            throw error
        }
    }
    
    func getPokemonDescription(pokemon: Pokemon) async throws -> String {
        do {
            let pokemonSpecies: PokemonSpeciesResponse = try await getSpeciesInfo(url: pokemon.species)
            return pokemonSpecies.flavor_text_entries.first!.flavor_text
        } catch {
            throw error
        }
    }
    
//    func getEvolutionChain(from: Pokemon) async throws -> [[Pokemon]] {
//        <#code#>
//    }
    
    func getPokemon(id: Int) async throws -> Pokemon {
        do {
            let response: PokeAPIResponse = try await queryAPI(url: "https://pokeapi.co/api/v2/pokemon/\(id)")
            
            let abilities: [String] = response.abilities.map { $0.ability.name }
            let moves: [String] = response.moves.map { $0.move.name }
            let types: [String] = response.types.map { $0.type.name }
            
            let pokemon: Pokemon = Pokemon(id: response.id, abilities: abilities, baseExperience: response.base_experience, heigh: response.height, moves: moves , name: response.name.capitalizeFirstLetter(), species: response.species.url, sprites: response.sprites, types: types, weight: response.weight)
            
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
