//
//  Bundle-Decode.swift
//  Pokedex
//
//  Created by Kyle Sarygin on 9/23/23.
//

import Foundation

enum BundleDecodingError: Error {
    case FileDNE
}

extension BundleDecodingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .FileDNE:
            return NSLocalizedString("File doesn't exist", comment: "URL error")
        }
    }
}

extension Bundle {
    func decode<T: Codable>(_ file: String) throws -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            throw BundleDecodingError.FileDNE
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file")
        }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Failed to decode file")
        }
        
        return decodedData
    }
}
