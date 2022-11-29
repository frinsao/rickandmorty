//
//  CharacterRepository.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation


enum CharacterError: Error {
    case badURL
    case invalidResponse
    case badDecoded
    case badResponse
    case badRequest

    func localized() -> String {
        switch self {
        case .badURL:
            return "¡Vaya! Parece que la URL no existe."
        case .invalidResponse:
            return "Vaya, parece que la comunicación con el servidor no ha sido la esperada"
        case .badDecoded:
            return "Parece que los datos recibidos son diferentes a los esperados."
        case .badResponse:
            return "Parece que algo en la llamada al servidor no ha ido como se esperaba."
        case .badRequest:
            return "Parece que la petición al servidor a fallado"
        }
    }
}

protocol CharacterRepositoryProcotol {
    func getCharacter(from page: Int) async throws -> Pager<CharacterDTO>
}

final class CharacterRepository: CharacterRepositoryProcotol {

    func getCharacter(from page: Int) async throws -> Pager<CharacterDTO>{
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page)") else {
            throw CharacterError.badURL
        }

        do {

            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
            guard let response = response as? HTTPURLResponse else {
                throw CharacterError.invalidResponse
            }

            print(String.init(data: data, encoding: .utf8))

            do {
                if (200..<300).contains(response.statusCode) {
                    return try JSONDecoder().decode(Pager<CharacterDTO>.self, from: data)
                } else {
                    throw CharacterError.badResponse
                }
            } catch {
                throw CharacterError.badDecoded
            }

        } catch {
            throw CharacterError.badRequest
        }
    }
}
