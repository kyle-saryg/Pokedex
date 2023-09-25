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
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(height: 100)
            .overlay {
                HStack {
                    Text("\(pokemon.id). \(pokemon.name)")
                        .font(.custom("PressStart2P", size: 13))
                        .padding()
                    Spacer()
                    AsyncImage(url: URL(string: pokemon.sprites.front_default))
                }
                
            }
            .padding(.horizontal)
    }
}

#Preview {
    PokemonItemView(pokemon: MockDataService.testPokemon, color: ViewModel.getItemColor(pokemon: MockDataService.testPokemon))
}
