//
//  EvolutionChain.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/27/23.
//

import Foundation

struct EvolutionChain: Decodable {
    let babyTriggerItem: String?
    let chain: EvolutionDetails
    let id: Int

    struct EvolutionDetails: Decodable {
        let evolvesTo: [EvolutionDetails]
        let species: Species
        
        struct Species: Decodable {
            let name: String
            let url: String
        }
    }
}
