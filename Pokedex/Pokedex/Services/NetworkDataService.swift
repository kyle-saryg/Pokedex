//
//  NetworkDataService.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

struct NetworkDataService: DataService {
    func getPokemon(id: Int) async throws -> PokeAPIResponse {
        do {
            let response: PokeAPIResponse = try await queryAPI(url: "https://pokeapi.co/api/v2/pokemon/\(id)")
            return response
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
