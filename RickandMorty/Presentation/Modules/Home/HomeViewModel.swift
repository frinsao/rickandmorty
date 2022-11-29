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
    var charactersHasUpdate: (() -> Void)?
    var characters = [CharacterDTO]() {
        didSet {
            charactersHasUpdate?()
        }
    }
    
    init(router: HomeRouterProtocol, characterUserCase: CharacterUserCaseProtocol) {
        self.router = router
        self.characterUserCase = characterUserCase
    }
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
            } catch {

            }
        }
    }
}


