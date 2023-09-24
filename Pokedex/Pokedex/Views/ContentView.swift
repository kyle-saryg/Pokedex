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
        ScrollView {
            VStack {
                ForEach(viewModel.pokemonCatalog) { pokemon in
                    PokemonItemView(pokemon: pokemon, color: ViewModel.getItemColor(pokemon: pokemon))
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
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
