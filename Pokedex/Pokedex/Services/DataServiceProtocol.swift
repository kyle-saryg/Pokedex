//
//  PokemonDataService.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/21/23.
//

import Foundation

protocol DataService {
    func getPokemon(id: Int) async throws -> Pokemon
}

enum PokemonDataError: Error {
    case InvalidID
}

enum NetworkError: Error {
    case InvalidURL
}
