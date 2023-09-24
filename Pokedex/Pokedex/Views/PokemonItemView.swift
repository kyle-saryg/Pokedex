//
//  PokemonItemView.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import SwiftUI

struct PokemonItemView: View {
    @State var pokemon: Pokemon
    @State var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(height: 100)
                .overlay {
                    HStack {
                        AsyncImage(url: URL(string: pokemon.sprites.front_default))
                        Spacer()
                        Text(pokemon.name)
                            .font(.title3)
                            .padding()
                    }
                    
                }
        }
    }
}

#Preview {
    PokemonItemView(pokemon: MockDataService.testPokemon, color: ViewModel.getItemColor(pokemon: MockDataService.testPokemon))
}
