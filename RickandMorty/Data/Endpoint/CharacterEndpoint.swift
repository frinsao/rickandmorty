//
//  CharacterEndpoint.swift
//  RickandMorty
//
//  Created by jesus on 13/2/23.
//

import Foundation


enum CharacterEndpoint {
    case getCharacterListWith(Int)
    case getFilterCharacterWith(String, and: Int)

    var endpoint: String {
        switch self {
        case .getCharacterListWith(let page):
            return "https://rickandmortyapi.com/api/character/?page=\(page)"
        case .getFilterCharacterWith(let name, let page):
            return "https://rickandmortyapi.com/api/character/?page=\(page)&name=\(name)"
        }
    }
}
