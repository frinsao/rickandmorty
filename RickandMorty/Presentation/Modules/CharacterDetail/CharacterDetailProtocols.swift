//
//  CharacterDetailProtocols.swift
//  RickandMorty
//
//  Created by jesus on 30/11/22.
//  
//

import Foundation

protocol CharacterDetailViewModelProtocol: ViewModelProtocol {

    var character: Character { get set }
}

protocol CharacterDetailBuilderProtocol: BuilderProtocol {
    func build(with character: CharacterDTO) -> CharacterDetailViewController 
}

protocol CharacterDetailRouterProtocol {

}

