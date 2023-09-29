//
//  DetailView.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/24/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailView_ViewModel
    @State var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.viewModel = DetailView_ViewModel(pokemon: pokemon)
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            Text("\(pokemon.id). \(pokemon.name)")
                .font(.custom("PressStart2P", size: 16))
            HStack {
                AsyncImage(url: URL(string: pokemon.sprites.back_default))
                AsyncImage(url: URL(string: pokemon.sprites.front_default))
            }
            Text(viewModel.pokemonDescription)
        }
        .task {
            await viewModel.getPokemonDescription()
        }
    }
}

#Preview {
    DetailView(pokemon: MockDataService.testPokemon)
}
