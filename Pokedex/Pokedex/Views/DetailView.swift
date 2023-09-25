//
//  DetailView.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/24/23.
//

import SwiftUI

struct DetailView: View {
    @State var pokemon: Pokemon
    var body: some View {
        VStack {
            Text("\(pokemon.id). \(pokemon.name)")
                .font(.custom("PressStart2P", size: 16))
            HStack {
                AsyncImage(url: URL(string: pokemon.sprites.back_default))
                AsyncImage(url: URL(string: pokemon.sprites.front_default))
            }
            
        }
    }
}

#Preview {
    DetailView(pokemon: MockDataService.testPokemon)
}
