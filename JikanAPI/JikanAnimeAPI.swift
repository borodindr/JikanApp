//
//  JikanAnimeAPI.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

public final class JikanAnimeAPI: ModelDetailsRequester {
    public typealias ModelType = Anime
    
    public var pathComponents: [Path] {
        [.anime]
    }
    
    public init() { }
}
