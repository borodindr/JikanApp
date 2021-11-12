//
//  JikanAnimeSearchAPI.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

/// Class responsible to search anime
public class JikanAnimeSearchAPI: SearchModelsRequester {
    public var searchQuery = ""
    public var currentPage = 0
    
    public typealias SearchModel = Anime.Short
    
    public var pathComponents: [Path] {
        [.search, .anime]
    }
    
    public init() { }
}
