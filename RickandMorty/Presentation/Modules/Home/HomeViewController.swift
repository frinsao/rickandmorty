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
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: - Properties
    var viewModel: HomeViewModelProtocol!

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
        setupUI()
        setupTableView()
        setupBindings()

        navigationItem.title = "Home"
    }

    // MARK: - Functions    
    fileprivate func setupBindings() {
        viewModel.charactersHasUpdated = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    fileprivate func setupUI() {
        searchBar.searchTextField.addTarget(self, action: #selector(filterAction), for: .editingChanged)
    }

    // MARK: - Observers
    @objc func filterAction() {
        if let text = searchBar.searchTextField.text {
            viewModel.charactersFiltered(with: text, isfirstSearching: true)
        } else {
            viewModel.restoreResults()
        }
    }

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
        viewModel.checkAndLoadNextPage(from: indexPath.row, text: searchBar.searchTextField.text )
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.character = Character(dto: viewModel.characters[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = viewModel.characters[indexPath.row]
        viewModel.pushToDetail(with: character)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
