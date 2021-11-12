//
//  AnimeSearchViewController.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit

/// View controller responsible for displaying searched Animes
final class AnimeSearchViewController: SearchViewController<AnimeSearchViewModel> {
    
    // MARK: - Private properties
    
    private let animeCellID = "animeCell"
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(viewModel: AnimeSearchViewModel())
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Anime"
        contentView.tableView.delegate = self
        contentView.tableView.register(AnimeSearchTableViewCell.self, forCellReuseIdentifier: animeCellID)
    }
    
    
    // MARK: - Private methods
    
    private func configure(cell: AnimeSearchTableViewCell, with item: AnimeSearchViewModel.SearchAPI.SearchModel) {
        cell.titleLabel.text = item.title
        cell.synopsisLabel.text = item.synopsis
        let datePeriodText = generateDatePeriod(dateFrom: item.startDate, dateTo: item.endDate)
        cell.datePeriodLabel.text = datePeriodText
        cell.episodesLabel.text = "Episodes: \(item.episodes)"
        cell.scoreLabel.text = "\(item.score)"
        cell.loadImage(from: item.imageURL)
    }
    
    // This method should be in ViewModel...
    private func generateDatePeriod(dateFrom: Date?, dateTo: Date?) -> String? {
        switch (dateFrom, dateTo) {
        case (let dateFrom?, let dateTo?):
            if dateFrom == dateTo {
                return "\(formateDate(dateFrom))"
            } else {
                return "\(formateDate(dateFrom)) - \(formateDate(dateTo))"
            }
        case (let dateFrom?, nil):
            return "\(formateDate(dateFrom)) - ..."
        case (nil, let dateTo?):
            return "\(formateDate(dateTo))"
        case (nil, nil):
            return nil
        }
    }
    
    private func formateDate(_ date: Date) -> String {
        date.formatted(.dateTime.year().month())
    }
    
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: animeCellID, for: indexPath) as? AnimeSearchTableViewCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        configure(cell: cell, with: item)
        return cell
    }
    
}

    // MARK: - UITableViewDelegate
extension AnimeSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        let itemID = item.id
        let vc = AnimeViewController(modelID: itemID)
        navigationController?.pushViewController(vc, animated: true)
    }
}
