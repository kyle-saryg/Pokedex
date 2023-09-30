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
        VStack(alignment: .leading){
            HStack {
                Text("\(pokemon.id). \(pokemon.name)")
                    .font(.custom("PressStart2P", size: 12))
                AsyncImage(url: URL(string: pokemon.sprites.front_default))
            }
            HStack {
                Text(viewModel.pokemonDescription)
                    .font(.system(size: 12))
                VStack {
                    Text("\(pokemon.height)")
                    Text("\(pokemon.baseExperience)")
                    Text("\(pokemon.weight)")
                }
            }
                
        }
        .border(Color.red, width: 1)
        .task {
            await viewModel.getPokemonDescription()
        }
    }
}

#Preview {
    DetailView(pokemon: MockDataService.testPokemon)
}
