//
//  SearchModelsRequester.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine

public protocol SearchModelsRequester: AnyObject, Requester {
    associatedtype SearchModel: SearchAPIModel
    
    var searchQuery: String { get set }
    var currentPage: Int { get set }
    
    func search(query: String) -> AnyPublisher<[SearchModel], Error>
    func nextPage() -> AnyPublisher<[SearchModel], Error>
}

extension SearchModelsRequester {
    var queryItems: [String: Any] {
        ["q": searchQuery,
         "page": currentPage]
    }
    
    /// Performs initial search of first page for provided query.
    /// - Parameter query: Search query to look for
    public func search(query: String) -> AnyPublisher<[SearchModel], Error> {
        currentPage = 1
        searchQuery = query
        return request()
    }
    
    /// Requests next page for previously used query in `search(query:)`
    public func nextPage() -> AnyPublisher<[SearchModel], Error> {
        assert(currentPage > 0, "WARN: Method 'nextPage()' should be called after initial search request using 'search(query:)")
        currentPage += 1
        return request()
    }
    
    // Makes search request with current page and search query
    private func request() -> AnyPublisher<[SearchModel], Error> {
        do {
            // Make sure the provided search query is valid
            try validateSearchQuery()
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
        return requestService.get(queryItems: queryItems)
            .map { (searchResult: SearchResult) in
                searchResult.results
            }
            .eraseToAnyPublisher()
    }
    
    private func validateSearchQuery() throws {
        // From API documentation: 'MyAnimeList only processes queries with a minimum of 3 letters'.
        // The API itself doesn't check length of query but returns 404.
        // Specified errors can be caught and handled properly
        guard searchQuery.count >= 3 else {
            throw JikanAPIError.searchQueryTooShort
        }
    }
}
