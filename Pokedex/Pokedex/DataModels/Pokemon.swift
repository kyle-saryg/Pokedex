//
//  Pokemon.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id: Int
    let abilities: [String]
    let baseExperience: Int
    let heigh: Int
    let moves: [String]
    let name: String
    let species: String
    let sprites: Sprite
    let types: [String]
    let weight: Int
}
