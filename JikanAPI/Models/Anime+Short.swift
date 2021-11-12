//
//  Anime+Short.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

extension Anime {
    public struct Short: SearchAPIModel {
        public let id: Int
        public let url: String
        public let imageURL: URL
        public let title: String
        public let airing: Bool
        public let synopsis: String
        public let type: AnimeType
        public let episodes: Int
        public let score: Double
        public let startDate: Date?
        public let endDate: Date?
        public let members: Int
        public let rated: RatingType?
    }
}

extension Anime.Short {
    private enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url = "url"
        case imageURL = "image_url"
        case title = "title"
        case airing = "airing"
        case synopsis = "synopsis"
        case type = "type"
        case episodes = "episodes"
        case score = "score"
        case startDate = "start_date"
        case endDate = "end_date"
        case members = "members"
        case rated = "rated"
    }
}
