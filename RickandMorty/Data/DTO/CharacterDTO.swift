//
//  Character.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

struct CharacterDTO: Codable {
    let id: Int
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let origin: OriginCharacterDTO?
    var episode = [String]()
    let url: String?
    let image: String?
}

struct OriginCharacterDTO: Codable {
    let name: String
    let url: String
}
