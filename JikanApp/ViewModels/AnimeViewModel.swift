//
//  AnimeViewModel.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine
import JikanAPI

final class AnimeViewModel: DetailsViewModel<JikanAnimeAPI> {
    convenience init(animeID: JikanAnimeAPI.ModelType.IDType) {
        self.init(modelID: animeID, apiService: JikanAnimeAPI())
    }
    
}
