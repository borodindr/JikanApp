//
//  JikanAPI.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine

/// Base class for all public Jikan API classes
///
/// You should not use this class directly. Instead please use one of the following public classes:
/// - `JikanAnimeAPI`
/// - `JikanCharacterAPI`
/// - `JikanAnimeSearchAPI`
/// - `JikanCharacterSearchAPI`
public class JikanAPI {
    let requestService: RequestService
    
    init(commonPathComponents paths: Path...) {
        let baseURL = "https://api.jikan.moe/v3"
        let urlString = paths.reduce(baseURL) { $0 + "/\($1.rawValue)"}
        let url = URL(string: urlString)!
        requestService = RequestService(baseURL: url)
    }
    
}
