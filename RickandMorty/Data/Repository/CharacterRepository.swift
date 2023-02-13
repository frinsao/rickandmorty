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
    func filterCharacter(with name: String, page: Int) async throws -> Pager<CharacterDTO>
}

final class CharacterRepository: CharacterRepositoryProcotol {

    func getCharacter(from page: Int) async throws -> Pager<CharacterDTO> {
        do {
            let response = try await characterService(with: CharacterEndpoint.getCharacterListWith(page).endpoint, type: Pager<CharacterDTO> .self)
            return response
        } catch {
            throw error
        }
    }

    func filterCharacter(with name: String, page: Int) async throws -> Pager<CharacterDTO> {

        do {
            let response = try await characterService(with: CharacterEndpoint.getFilterCharacterWith(name, and: page).endpoint, type: Pager<CharacterDTO> .self)
            return response
        } catch {
            throw error
        }
    }

    func characterService<T: Decodable>(with stringURL: String, type: T.Type ) async throws -> T {

        guard let url = URL(string: stringURL) else {
            throw CharacterError.badURL
        }

        do {

            let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
            guard let response = response as? HTTPURLResponse else {
                throw CharacterError.invalidResponse
            }
            
            do {
                if (200..<300).contains(response.statusCode) {
                    return try JSONDecoder().decode(type.self, from: data)
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
