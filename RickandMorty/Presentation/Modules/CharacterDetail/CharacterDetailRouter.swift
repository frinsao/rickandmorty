//
//  CharacterDetailRouter.swift
//  RickandMorty
//
//  Created by jesus on 30/11/22.
//  
//

import UIKit

final class CharacterDetailRouter {
    // MARK: - Properties
	private weak var viewController: CharacterDetailViewController?

    // MARK: - Init
	required init(viewController: CharacterDetailViewController?) {
        self.viewController = viewController
    }
}

extension CharacterDetailRouter: CharacterDetailRouterProtocol {
    
}
