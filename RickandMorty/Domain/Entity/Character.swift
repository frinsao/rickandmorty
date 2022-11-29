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

    init(id: Int,
         name: String,
         status: String,
         species: String,
         gender: String,
         episode: [String],
         url: URL?,
         image: URL?) {
        self.id      = id
        self.name    = name
        self.status  = status
        self.species = species
        self.gender  = gender
        self.episode = episode
        self.url     = url
        self.image   = image
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
    }
}
