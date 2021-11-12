//
//  ModelDetailsRequester.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine

public protocol ModelDetailsRequester: Requester {
    associatedtype SearchModelType: SearchAPIModel
    func get(id modelID: SearchModelType.IDType) -> AnyPublisher<SearchModelType, Error>
}

extension ModelDetailsRequester {
    public func get(id modelID: SearchModelType.IDType) -> AnyPublisher<SearchModelType, Error> {
        requestService.get("\(modelID)")
            .eraseToAnyPublisher()
    }
}
