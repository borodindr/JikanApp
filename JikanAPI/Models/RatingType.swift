//
//  RatingType.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

public enum RatingType: String, Decodable {
    case g = "G"
    case pg = "PG"
    case pg13 = "PG-13"
    case r17 = "R"
    case r = "R+"
    case rx = "Rx"
}

extension RatingType {
    public var name: String {
        rawValue
    }
    
    public var description: String {
        switch self {
        case .g:
            return "All Ages"
        case .pg:
            return "Children"
        case .pg13:
            return "Teens 13 or older"
        case .r17:
            return "17+ recommended (violence & profanity)"
        case .r:
            return "Mild Nudity (may also contain violence & profanity)"
        case .rx:
            return "Hentai (extreme sexual content/nudity)"
        }
    }
}
