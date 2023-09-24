//
//  ContentView-ViewModel.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    @Published var pokemonCatalog: [Pokemon] = []
    
    private var dataService: any DataService
     
    init(dataService: any DataService = NetworkDataService()) {
        self.dataService = dataService
    }
    
    func addToCatalog() async {
        for i in 1..<10 {
            do {
                let pokemon = try await dataService.getPokemon(id: i)
                pokemonCatalog.append(pokemon)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getItemColor(pokemon: Pokemon) -> Color {
        switch pokemon.types.first {
        case "water":
            return Color.teal
        case "fire":
            return Color.orange
        case "grass":
            return Color.green
        case "normal":
            return Color.gray
        default:
                return Color.gray
        }
    }
}
