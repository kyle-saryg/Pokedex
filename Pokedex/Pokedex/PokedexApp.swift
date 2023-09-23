//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/21/23.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
