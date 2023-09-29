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
    private var dataService: any DataService
    
    @Published var pokemonCatalog: [Pokemon] = []
     
    init(dataService: any DataService = NetworkDataService()) {
        self.dataService = dataService
    }
    
    func addToCatalog(_ count: Int) async {
        for i in 1...count {
            do {
                let pokemon = try await dataService.getPokemon(id: i)
                pokemonCatalog.append(pokemon)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // Adding type Color to pokemon struct invalidates Codable
    static func getItemColor(pokemon: Pokemon) -> Color {
        switch pokemon.types.first {
        case "bug":
            return Color(red: 168/255, green: 184/255, blue: 32/255)
        case "dark":
            return Color(red: 112/255, green: 88/255, blue: 72/255)
        case "dragon":
            return Color(red: 112/255, green: 56/255, blue: 248/255)
        case "electric":
            return Color(red: 248/255, green: 208/255, blue: 48/255)
        case "fairy":
            return Color(red: 255/255, green: 192/255, blue: 203/255)
        case "fighting":
            return Color(red: 192/255, green: 48/255, blue: 40/255)
        case "fire":
            return Color(red: 240/255, green: 128/255, blue: 48/255)
        case "flying":
            return Color(red: 169/255, green: 144/255, blue: 240/255)
        case "ghost":
            return Color(red: 112/255, green: 88/255, blue: 152/255)
        case "grass":
            return Color(red: 120/255, green: 200/255, blue: 80/255)
        case "ground":
            return Color(red: 224/255, green: 192/255, blue: 104/255)
        case "ice":
            return Color(red: 152/255, green: 216/255, blue: 216/255)
        case "normal":
            return Color(red: 168/255, green: 168/255, blue: 120/255)
        case "poison":
            return Color(red: 160/255, green: 64/255, blue: 160/255)
        case "psychic":
            return Color(red: 248/255, green: 88/255, blue: 136/255)
        case "rock":
            return Color(red: 184/255, green: 160/255, blue: 56/255)
        case "steel":
            return Color(red: 184/255, green: 184/255, blue: 208/255)
        case "water":
            return Color(red: 104/255, green: 144/255, blue: 240/255)
        default:
            return Color.white
        }
    }
}
