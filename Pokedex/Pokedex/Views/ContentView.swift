//
//  ContentView.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/21/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "PokemonSolidNormal", size: 30)!]
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.pokemonCatalog) { pokemon in
                        NavigationLink {
                            DetailView(pokemon: pokemon)
                        } label: {
                            PokemonItemView(pokemon: pokemon, color: ViewModel.getItemColor(pokemon: pokemon))
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .navigationTitle("Pokemon")
            
//            .toolbar(content: {
//                ToolbarItem(placement: .topBarLeading) {
//                    Text("Pokedex")
//                        .navigationBarTitleDisplayMode(.large)
//                        .font(.custom("PokemonSolidNormal", size: 30))
//                }
//            })
            .border(Color.red, width: 3)
        }
        .task {
            await viewModel.addToCatalog(151)
        }
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
