//
//  DetailsViewModel.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine
import JikanAPI

class DetailsViewModel<APIService>: AnyDetailsViewModel where APIService: ModelDetailsRequester {
    lazy var item: AnyPublisher<APIService.ModelType, Never> = apiService.get(id: modelID)
        .receive(on: DispatchQueue.main)
        .handleEvents(receiveSubscription: { [isLoading] _ in
            isLoading.send(true)
        })
        .print()
        .catch { _ in Empty() }
        .handleEvents(receiveOutput: { [isLoading] _ in
            isLoading.send(false)
        })
        .share()
        .eraseToAnyPublisher()
    
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    var apiService: APIService
    
    private let modelID: APIService.ModelType.IDType
    
    init(modelID: APIService.ModelType.IDType, apiService: APIService) {
        self.modelID = modelID
        self.apiService = apiService
    }
}
