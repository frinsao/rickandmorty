//
//  HomeViewModel.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    
    let router: HomeRouterProtocol
    let characterUserCase: CharacterUserCaseProtocol

    private var charactersPage = 1
    private var filterCharacterPage = 1
    private var characterRestore = [CharacterDTO]()
    private var charactersFiltered = [CharacterDTO]()

    var charactersHasUpdated: (() -> Void)?
    var characters = [CharacterDTO]() { didSet { charactersHasUpdated?() } }

    init(router: HomeRouterProtocol, characterUserCase: CharacterUserCaseProtocol) {
        self.router = router
        self.characterUserCase = characterUserCase
    }
    private var needNextPage = false
    private var needFilterNextPage = false
}

// MARK: - Life cycle
extension HomeViewModel {
    
    func viewDidLoad() {
        getCharacters()
    }
    
    func viewDidAppear() {
        
    }
    
    func viewDidDisappear() {
        
    }

    //MARK: - Functions
    func getCharacters() {
        Task {
            do {
                let (characters, hasNextPage) = try await characterUserCase.getCharacters(from: charactersPage)
                self.characterRestore.append(contentsOf: characters)
                self.characters.append(contentsOf: characters)
                charactersPage = hasNextPage ? charactersPage + 1 : 1
                needNextPage = hasNextPage
            } catch {
                if let error = error as? CharacterError {
                    router.showAlert(with: error.localized())
                }
            }
        }
    }

    func checkAndLoadNextPage(from currentRow: Int, text: String?) {
        if charactersFiltered.count != 0 {
            if let text = text, needFilterNextPage && characters.count - 6 < currentRow {
                charactersFiltered(with: text)
            }
        } else {
            if needNextPage && characters.count - 6 < currentRow {
                getCharacters()
            }
        }
    }

    func charactersFiltered(with text: String, isfirstSearching: Bool = false) {

        if text.isEmpty {
           restoreResults()
        } else {
            Task {
                do {
                    filterCharacterPage = !isfirstSearching ? filterCharacterPage : 1

                    let (characters, hasNextPage) = try await characterUserCase.filterCharacter(with: text, page: filterCharacterPage )

                    self.charactersFiltered = characters
                    self.characters = charactersFiltered
                    filterCharacterPage = hasNextPage ? filterCharacterPage + 1 : 1
                    needFilterNextPage = hasNextPage
                }
            }
        }
    }

    func restoreResults() {
        characters.removeAll()
        characters = characterRestore
        charactersFiltered.removeAll()
        filterCharacterPage = 1
    }

    func pushToDetail(with character: CharacterDTO) {
        router.pushToDetail(with: character)
    }
}


