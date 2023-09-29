//
//  DetailView-ViewModel.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/28/23.
//

import Foundation

@MainActor
class DetailView_ViewModel: ObservableObject {
    private var dataService: any DataService
    
    @Published var pokemon: Pokemon
    @Published var pokemonDescription: String = "---"
    
    init(pokemon: Pokemon, dataService: any DataService = NetworkDataService()) {
        self.pokemon = pokemon
        self.dataService = dataService
    }
    
    func getPokemonDescription() async {
        do {
            pokemonDescription = try await dataService.getPokemonDescription(pokemon: pokemon)
        } catch {
            print("Description Fetch Failed")
            return
        }
    }
}
