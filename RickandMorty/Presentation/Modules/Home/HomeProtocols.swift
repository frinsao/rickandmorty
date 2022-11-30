//
//  HomeProtocols.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

protocol HomeBuilderProtocol: BuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {
    func showAlert(with message: String)
    func pushToDetail(with character: CharacterDTO)
}

protocol HomeViewModelProtocol: ViewModelProtocol {
    func getCharacters()
    func checkAndLoadNextPage(from currentRow: Int)
    func pushToDetail(with character: CharacterDTO)

    var charactersHasUpdated: (() -> Void)? { get set }
    var characters: [CharacterDTO] { get set }
}
