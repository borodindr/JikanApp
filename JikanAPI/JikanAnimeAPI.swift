//
//  JikanAnimeAPI.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine

final class JikanAnimeAPI: JikanAPI {
    
    public convenience init() {
        self.init(commonPathComponents: .anime)
    }
    
    func get(id animeID: Anime.IDType) -> AnyPublisher<Anime, Error> {
        requestService.get("\(animeID)")
            .eraseToAnyPublisher()
    }
}
