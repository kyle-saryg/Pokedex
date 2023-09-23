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
            Text(pokemon.name)
        }
        .task {
            await viewModel.addToCatalog()
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
