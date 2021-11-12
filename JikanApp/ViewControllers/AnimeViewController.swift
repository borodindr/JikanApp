//
//  AnimeViewController.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import UIKit
import JikanAPI

final class AnimeViewController: DetailsViewController<AnimeViewModel> {
    
    convenience init(modelID: Int) {
        self.init(modelID: modelID, viewModel: AnimeViewModel(animeID: modelID))
    }
    
    override func updateView(with item: Anime) {
        contentView.tempNameLabel.text = item.title
    }
}
