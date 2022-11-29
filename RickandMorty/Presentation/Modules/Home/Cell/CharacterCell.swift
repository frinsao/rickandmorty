//
//  CharacterCell.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    var character: Character? {
        didSet { setupUI() }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupUI() {

        containerView.layer.cornerRadius = 6

        if let character = character {
            nameLabel.text      = character.name
            specieLabel.text    = character.species
            genderLabel.text    = character.gender
            if let url = character.image {
                characterImageView.load(url: url)
            }
        }
    }
}
