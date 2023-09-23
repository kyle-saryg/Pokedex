//
//  ContentView-ViewModel.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var pokemonCatalog: [PokeAPIResponse] = []
    
    private var dataService: any DataService
     
    init(dataService: any DataService = NetworkDataService()) {
        self.dataService = dataService
    }
    
    func addToCatalog() async {
        do {
            let pokemon = try await dataService.getPokemon(id: 1)
            pokemonCatalog.append(pokemon)
        } catch {
            print(error.localizedDescription)
        }
    }
}
