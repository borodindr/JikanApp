//
//  RequestService.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine

enum RequestServiceError: Error {
    case invalidURL
}

final class RequestService {
    let baseURL: URL
    
    var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func get<T>(
        _ paths: String...,
        queryItems: [String: Any] = [:]
    ) -> AnyPublisher<T, Error> where T: Decodable {
        let url: URL
        do {
            url = try generateURL(paths: paths, queryItems: queryItems)
        } catch {
            return Fail(error: error).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
        // TODO: Delete. Temp part to see raw response
//            .map { (data: Data, response: URLResponse) -> (data: Data, response: URLResponse) in
////                let data = output.data
//                let result = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(result)
//
//                return (data: data, response: response)
//            }
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            
            .eraseToAnyPublisher()
    }
    
    private func generateURL(paths: [String], queryItems: [String: Any]) throws -> URL {
        guard var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            throw RequestServiceError.invalidURL
        }
        urlComponents.path = paths.reduce(urlComponents.path) { $0 + "/\($1)"}
        
        let existingQueryItems = urlComponents.queryItems ?? []
        let newQueryItems = queryItems.map {
            URLQueryItem(name: $0, value: "\($1)")
        }
        urlComponents.queryItems = existingQueryItems + newQueryItems
        
        guard let url = urlComponents.url else {
            throw RequestServiceError.invalidURL
        }
        
        return url
    }
}
