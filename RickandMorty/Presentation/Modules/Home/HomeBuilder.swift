//
//  HomeBuilder.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

final class HomeBuilder: HomeBuilderProtocol {
    func build() -> HomeViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let characterRepository = CharacterRepository()
        let characterUserCase = CharacterUserCase(repository: characterRepository)
        let viewModel = HomeViewModel(router: router, characterUserCase: characterUserCase)
        viewController.viewModel = viewModel
        return viewController
    }
}
