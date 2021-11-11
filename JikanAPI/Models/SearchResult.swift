//
//  SearchAnimeResult.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

struct SearchResult<ResultType>: Decodable where ResultType: SearchAPIModel {
    let requestHash: String
    let requestCached: Bool
    let requestCacheExpiry: Int
    let results: [ResultType]
    let lastPage: Int
}

extension SearchResult {
    private enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case results = "results"
        case lastPage = "last_page"
    }
}
