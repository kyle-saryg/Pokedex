//
//  String-CapitalizeFirstLetter.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizeFirstLetter()
    }
}
