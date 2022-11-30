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

    private var currentPage = 1
    var charactersHasUpdated: (() -> Void)?
    var characters = [CharacterDTO]() {
        didSet {
            charactersHasUpdated?()
        }
    }
    
    init(router: HomeRouterProtocol, characterUserCase: CharacterUserCaseProtocol) {
        self.router = router
        self.characterUserCase = characterUserCase
    }
    private var needNextPage = false
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
                let (characters, hasNextPage) = try await characterUserCase.getCharacters(from: currentPage)
                self.characters.append(contentsOf: characters)
                currentPage = hasNextPage ? currentPage + 1 : 1
                needNextPage = hasNextPage
            } catch {
                if let error = error as? CharacterError {
                    router.showAlert(with: error.localized())
                }
            }
        }
    }

    func checkAndLoadNextPage(from currentRow: Int) {
        if needNextPage && characters.count - 6 < currentRow {
            getCharacters()
        }
    }

    func pushToDetail(with character: CharacterDTO) {
        router.pushToDetail(with: character)
    }
}


