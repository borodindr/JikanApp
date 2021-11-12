//
//  Anime+Preview.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

public struct Preview: APIModel {
    public let id: Int
    public let type: PreviewType
    public let name: String
    public let url: URL
}

extension Preview {
    private enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case type = "type"
        case name = "name"
        case url = "url"
    }
}
