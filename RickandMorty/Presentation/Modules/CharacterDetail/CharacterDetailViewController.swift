//
//  CharacterDetailViewController.swift
//  RickandMorty
//
//  Created by jesus on 30/11/22.
//  
//

import UIKit

final class CharacterDetailViewController: BaseViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderDescriptionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusDescriptionLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var speciesDescriptionLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var originDescriptionLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: CharacterDetailViewModelProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        setupBindings()
        setupUI()
    }

    // MARK: - Functions
    fileprivate func setupBindings() {
        // Do bindings setup

    }

    fileprivate func setupUI() {
        navigationItem.title = viewModel.character.name
        if let imageURL = viewModel.character.image {
            characterImageView.load(url: imageURL)
        }

        genderLabel.text             = "Gender"
        genderDescriptionLabel.text  = viewModel.character.gender ?? "--"
        statusLabel.text             = "Estatus"
        statusDescriptionLabel.text  = viewModel.character.status ?? "--"
        speciesLabel.text            = "Species"
        speciesDescriptionLabel.text = viewModel.character.species ?? "--"
        originLabel.text             = "Origin"
        originDescriptionLabel.text  = viewModel.character.origin?.name ?? "--"
        episodesLabel.text           = "\(viewModel.character.episode.count) episodes"
    }
}
