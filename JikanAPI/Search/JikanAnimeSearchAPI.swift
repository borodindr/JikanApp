//
//  JikanAnimeSearchAPI.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

/// Class responsible to search anime
public class JikanAnimeSearchAPI: JikanSearchAPI<Anime.Short> {
    public convenience init() {
        self.init(searchPathType: .anime)
    }
}
