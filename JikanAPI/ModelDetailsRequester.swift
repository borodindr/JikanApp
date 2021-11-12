//
//  ModelDetailsRequester.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine

public protocol ModelDetailsRequester: Requester {
    associatedtype ModelType: APIModel
    func get(id modelID: ModelType.IDType) -> AnyPublisher<ModelType, Error>
}

extension ModelDetailsRequester {
    public func get(id modelID: ModelType.IDType) -> AnyPublisher<ModelType, Error> {
        requestService.get("\(modelID)")
            .eraseToAnyPublisher()
    }
}
