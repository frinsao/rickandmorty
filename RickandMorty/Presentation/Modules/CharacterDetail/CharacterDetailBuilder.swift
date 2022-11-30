//
//  CharacterDetailBuilder.swift
//  RickandMorty
//
//  Created by jesus on 30/11/22.
//  
//

import UIKit

final class CharacterDetailBuilder: CharacterDetailBuilderProtocol {
    func build(with character: CharacterDTO) -> CharacterDetailViewController {

        let viewController =  CharacterDetailViewController()
        let router = CharacterDetailRouter(viewController: viewController)
        let viewModel = CharacterDetailViewModel(router: router, character: character)
        viewController.viewModel = viewModel
        
        return viewController
    }
}
