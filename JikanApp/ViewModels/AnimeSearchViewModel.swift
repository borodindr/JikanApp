//
//  AnimeSearchViewModel.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine
import JikanAPI

/// View Model responsible to search Anime from API.
final class AnimeSearchViewModel: SearchViewModel<JikanAnimeSearchAPI> {
    convenience init() {
        self.init(searchAPI: JikanAnimeSearchAPI())
    }
}
