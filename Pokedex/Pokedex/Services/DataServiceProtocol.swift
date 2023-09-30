//
//  PokemonDataService.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/21/23.
//

import Foundation

protocol DataService {
    func getPokemon(id: Int) async throws -> Pokemon
    func getSpeciesInfo(url: String) async throws -> PokemonSpeciesResponse
    func getPokemonDescription(pokemon: Pokemon) async throws -> String
}

enum PokemonDataError: Error {
    case InvalidID
}

enum NetworkError: Error {
    case InvalidURL
}
