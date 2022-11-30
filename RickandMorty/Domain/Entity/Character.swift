//
//  Character.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import UIKit

class Character {
    let id: Int
    var name: String?
    var status: String?
    var species: String?
    var gender: String?
    var episode: [String]
    let url: URL?
    let image: URL?
    let origin: OriginCharacter?

    init(id: Int,
         name: String,
         status: String,
         species: String,
         gender: String,
         episode: [String],
         url: URL?,
         image: URL?,
         origin: OriginCharacter?) {
        self.id      = id
        self.name    = name
        self.status  = status
        self.species = species
        self.gender  = gender
        self.episode = episode
        self.url     = url
        self.image   = image
        self.origin = origin
    }

    init(dto: CharacterDTO) {
        self.id      = dto.id
        self.name    = dto.name
        self.status  = dto.status
        self.species = dto.species
        self.gender  = dto.gender
        self.episode = dto.episode
        self.url     = URL(string: dto.url)
        self.image   = URL(string: dto.image)
        if let origin = dto.origin {
            self.origin  = OriginCharacter(dto: origin)
        } else {
            self.origin = nil
        }
    }
}

class OriginCharacter {
    let name: String
    let url: URL?

    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }

    init(dto: OriginCharacterDTO) {
        self.name = dto.name
        self.url = URL(string: dto.url)
    }
}
