//
//  CharacterDetailViewModel.swift
//  RickandMorty
//
//  Created by jesus on 30/11/22.
//  
//

import Foundation

final class CharacterDetailViewModel: CharacterDetailViewModelProtocol {

    // MARK: - Properties
	private let router: CharacterDetailRouter
    var character: Character

    // MARK: - Init
    required init(router: CharacterDetailRouter, character: CharacterDTO) {
		self.router = router
        self.character = Character(dto: character)
	}
}

extension CharacterDetailViewModel {
	
	// MARK: - Life cycle
	func viewDidLoad() {
	 // Called when view is appeared
    }

	func viewDidAppear() {
        // Called when view is appeared
	}
	  
    func viewDidDisappear() {
    }

    //MARK: - Functions
}

