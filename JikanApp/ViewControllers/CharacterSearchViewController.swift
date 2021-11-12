//
//  CharacterSearchViewController.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit

/// View controller responsible for displaying searched Characters
final class CharacterSearchViewController: SearchViewController<CharacterSearchViewModel> {
    
    // MARK: - Private properties
    
    private let characterCellID = "characterCell"
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(viewModel: CharacterSearchViewModel())
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        contentView.tableView.register(CharacterSearchTableViewCell.self, forCellReuseIdentifier: characterCellID)
    }
    
    
    // MARK: - Private methods
    
    private func configure(cell: CharacterSearchTableViewCell, with item: CharacterSearchViewModel.SearchAPI.SearchModel) {
        cell.nameLabel.text = item.name
        let altNames = item.alternativeNames.joined(separator: ", ")
        cell.alternativeNamesLabel.text = altNames
        cell.loadImage(from: item.imageURL)
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: characterCellID, for: indexPath) as? CharacterSearchTableViewCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        configure(cell: cell, with: item)
        return cell
    }
    
}
