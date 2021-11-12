//
//  Requester.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine

public protocol Requester {
    var pathComponents: [Path] { get }
}

extension Requester {
    var requestService: RequestService {
        let baseURL = "https://api.jikan.moe/v3"
        let urlString = pathComponents.reduce(baseURL) { $0 + "/\($1.rawValue)"}
        let url = URL(string: urlString)!
        return RequestService(baseURL: url)
    }
}
