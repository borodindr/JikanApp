//
//  AnySearchViewModel.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine
import JikanAPI

// Protocol describing SearchViewModel interface to then use as generic type.
protocol AnySearchViewModel {
    associatedtype SearchAPI: SearchModelsRequester
    
    var searchAPI: SearchAPI { get }
    var searchQuerySubject: PassthroughSubject<String, Never> { get }
    var isLoading: CurrentValueSubject<Bool, Never> { get }
    var searchItems: AnyPublisher<[SearchAPI.SearchModel], Never> { get }
}
