//
//  JikanCharacterSearchAPI.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

/// Class responsible to search characters
public class JikanCharacterSearchAPI: SearchModelsRequester {
    public var searchQuery = ""
    public var currentPage = 0
    
    public typealias SearchModel = Character.Short
    
    public var pathComponents: [Path] {
        [.search, .character]
    }
    
    public init() { }
}
