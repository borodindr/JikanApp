//
//  Character+Short.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

extension Character {
    public struct Short: SearchAPIModel {
        public let id: Int
        public let url: String
        public let imageURL: URL
        public let name: String
        public let alternativeNames: [String]
        public let anime: [Preview]
        public let manga: [Preview]
    }
}

extension Character.Short {
    private enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url = "url"
        case imageURL = "image_url"
        case name = "name"
        case alternativeNames = "alternative_names"
        case anime = "anime"
        case manga = "manga"
    }
}

