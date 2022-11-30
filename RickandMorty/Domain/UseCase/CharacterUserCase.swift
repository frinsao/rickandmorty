//
//  CharacterUserCase.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

final class CharacterUserCase {
    let repository: CharacterRepositoryProcotol

    init(repository: CharacterRepositoryProcotol) {
        self.repository = repository
    }
}

protocol CharacterUserCaseProtocol {
    func getCharacters(from page: Int) async throws -> ([CharacterDTO], Bool)
    func filterCharacter(with name: String, page: Int) async throws -> ([CharacterDTO], Bool)
}

extension CharacterUserCase: CharacterUserCaseProtocol {

    func getCharacters(from page: Int) async throws -> ([CharacterDTO], Bool) {

        do {

            let response = try await repository.getCharacter(from: page)
            guard let nextPage = response.info.next, !nextPage.isEmpty  else {
                return (response.results, false)
            }

            return (response.results, true)
        }
    }

    func filterCharacter(with name: String, page: Int) async throws -> ([CharacterDTO], Bool) {
        do {
            let response = try await repository.filterCharacter(with: name, page: page)
            guard let nextPage = response.info.next, !nextPage.isEmpty  else {
                return (response.results, false)
            }

            return (response.results, true)
        }
    }
}
