//
//  RickandMortyTests.swift
//  RickandMortyTests
//
//  Created by jesus on 30/11/22.
//

import XCTest

final class CharacterUseCaseTests: XCTestCase {

    func makeSut() -> CharacterUserCase {
        let repository = CharacterRepository()
        let useCase = CharacterUserCase(repository: repository)
        return useCase
    }

    func testGetCharacters() async throws {

        let sut = makeSut()

        let characters = try await sut.getCharacters(from: 1)

        XCTAssertNotNil(characters)
    }


    func testCharacterFiler() async throws {
        let sut = makeSut()

        let mockTest = ["li", "ri", "mo"]

        for index in 0...mockTest.count - 1 {
            let text = mockTest[index]
            let characters = try await sut.filterCharacter(with: text, page: 1)
            XCTAssertNoThrow(characters)
        }
    }
}
