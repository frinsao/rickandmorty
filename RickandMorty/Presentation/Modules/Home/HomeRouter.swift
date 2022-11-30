//
//  HomeRouter.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import UIKit

final class HomeRouter {

    weak var viewController: HomeViewController?

    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {

    func showAlert(with message: String) {

        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let aceptButton = UIAlertAction(title: "Aceptar", style: .destructive)
        alertController.addAction(aceptButton)
        DispatchQueue.main.async {
            self.viewController?.present(alertController, animated: true, completion: nil)
        }
    }

    func pushToDetail(with character: CharacterDTO) {
        let detailController = Container.shared.characterDetailBuilder().build(with: character)
        viewController?.navigationController?.pushViewController(detailController, animated: true)
    }
}
