//
//  HomeRouter.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

final class HomeRouter {

    weak var viewController: HomeViewController?

    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {
    
}
