//
//  ContentView.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/21/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List(viewModel.pokemonCatalog) { pokemon in
            HStack {
                Text(pokemon.name)
                Spacer()
                AsyncImage(url: URL(string: pokemon.sprites.front_default))
                AsyncImage(url: URL(string: pokemon.sprites.back_default))
            }
        }
        .task {
            await viewModel.addToCatalog()
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
