//
//  SearchViewModel.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine
import JikanAPI
import UIKit

/// Base view model class responsible to search items from API
class SearchViewModel<SearchAPI>: AnySearchViewModel where SearchAPI: SearchModelsRequester {
    
    // MARK: - Public properties
    
    /// Subject to hold search query and react on its changes
    let searchQuerySubject = PassthroughSubject<String, Never>()
    /// Subject representing loading state of the view model
    let isLoading = CurrentValueSubject<Bool, Never>(false)
    /// Search result updated by changes in search query
    lazy var searchItems: AnyPublisher<[SearchAPI.SearchModel], Never> = searchQuerySubject
        // Ignore values if there too fast changes and take only last
        .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
        // Additional check that query is long enough
        .filter { $0.count >= 3 }
        // Side effect to update loading state.
        .handleEvents(receiveOutput: { [isLoading] _ in
            isLoading.send(true)
        })
        // Generate request from query
        // Used map instead of flatMap to be able to use switchToLatest later
        .map { [searchAPI] query in
            searchAPI.search(query: query)
        }
        // Ignore old outdated request
        .switchToLatest()
        // TODO: Implement proper error handling. E.g. show alert
        .catch { _ in Empty() }
        .receive(on: DispatchQueue.main)
        .handleEvents(receiveOutput: { [isLoading] _ in
            isLoading.send(false)
        })
        // To avoid duplications for different subscriptions
        .share()
        // Start with empty array
        .prepend([])
        .eraseToAnyPublisher()
    
    let searchAPI: SearchAPI
    
    
    // MARK: - Initializers
    
    init(searchAPI: SearchAPI) {
        self.searchAPI = searchAPI
    }
    
}
