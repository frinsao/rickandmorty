//
//  HomeViewController.swift
//  RickandMorty
//
//  Created by jesus on 29/11/22.
//

import UIKit

class HomeViewController: BaseViewController {
    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    var viewModel: HomeViewModel!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        setupTableView()
        setupBindings()
    }

    // MARK: - Functions
    func setupBindings() {
        viewModel.charactersHasUpdate = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Observers

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.checkAndLoadNextPage(from: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.character = Character(dto: viewModel.characters[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
