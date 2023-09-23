//
//  MockDataService.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

struct MockDataService: DataService {
    func getPokemon(id: Int) async throws -> PokeAPIResponse {
        do {
            let pokemon: PokeAPIResponse = try Bundle.main.decode("\(id).json")
            return pokemon
        } catch {
            throw error
        }
    }
}
