//
//  AnyDetailsViewModel.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine
import JikanAPI

// Protocol describing DetailsViewModel interface to then use as generic type.
protocol AnyDetailsViewModel {
    associatedtype APIService: ModelDetailsRequester
    
    var apiService: APIService { get }
    var item: AnyPublisher<APIService.ModelType, Never> { get }
    var isLoading: CurrentValueSubject<Bool, Never> { get }
}
