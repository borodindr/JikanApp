//
//  Anime.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

public struct Anime: APIModel {
    public let id: Int
    public let url: String
    public let imageURL: URL
    public let title: String
    public let titleEnglish: String
    public let titleJapanese: String
    public let type: AnimeType
    public let episodes: Int
    public let airing: Bool
    public let rating: String
    public let score: Double
    public let synopsis: String
    public let background: String
}

extension Anime {
    private enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url = "url"
        case imageURL = "image_url"
        case title = "title"
        case titleEnglish = "title_english"
        case titleJapanese = "title_japanese"
        case type = "type"
        case episodes = "episodes"
        case airing = "airing"
        case rating = "rating"
        case score = "score"
        case synopsis = "synopsis"
        case background = "background"
    }
}

// TODO: Add fields
/*
 {
     "trailer_url": "https://www.youtube.com/embed/qig4KOK2R2g?enablejsapi=1&wmode=opaque&autoplay=1",
     
     "title_synonyms": [],
     "source": "Original",
     "status": "Finished Airing",
     "aired": {
         "from": "1998-04-03T00:00:00+00:00",
         "to": "1999-04-24T00:00:00+00:00",
         "prop": {
             "from": {
                 "day": 3,
                 "month": 4,
                 "year": 1998
             },
             "to": {
                 "day": 24,
                 "month": 4,
                 "year": 1999
             }
         },
         "string": "Apr 3, 1998 to Apr 24, 1999"
     },
     "duration": "24 min per ep",
     "scored_by": 716327,
     "rank": 33,
     "popularity": 45,
     "members": 1485791,
     "favorites": 65142,
     "premiered": "Spring 1998",
     "broadcast": "Saturdays at 01:00 (JST)",
     "related": {
         "Adaptation": [
             {
                 "mal_id": 173,
                 "type": "manga",
                 "name": "Cowboy Bebop",
                 "url": "https://myanimelist.net/manga/173/Cowboy_Bebop"
             }
         ],
         "Side story": [
             {
                 "mal_id": 5,
                 "type": "anime",
                 "name": "Cowboy Bebop: Tengoku no Tobira",
                 "url": "https://myanimelist.net/anime/5/Cowboy_Bebop__Tengoku_no_Tobira"
             }
         ],
         "Summary": [
             {
                 "mal_id": 4037,
                 "type": "anime",
                 "name": "Cowboy Bebop: Yose Atsume Blues",
                 "url": "https://myanimelist.net/anime/4037/Cowboy_Bebop__Yose_Atsume_Blues"
             }
         ]
     },
     "producers": [
         {
             "mal_id": 23,
             "type": "anime",
             "name": "Bandai Visual",
             "url": "https://myanimelist.net/anime/producer/23/Bandai_Visual"
         }
     ],
     "licensors": [
         {
             "mal_id": 102,
             "type": "anime",
             "name": "Funimation",
             "url": "https://myanimelist.net/anime/producer/102/Funimation"
         }
     ],
     "studios": [
         {
             "mal_id": 14,
             "type": "anime",
             "name": "Sunrise",
             "url": "https://myanimelist.net/anime/producer/14/Sunrise"
         }
     ],
     "genres": [
         {
             "mal_id": 1,
             "type": "anime",
             "name": "Action",
             "url": "https://myanimelist.net/anime/genre/1/Action"
         }
     ],
     "explicit_genres": [],
     "demographics": [],
     "themes": [
         {
             "mal_id": 29,
             "type": "anime",
             "name": "Space",
             "url": "https://myanimelist.net/anime/genre/29/Space"
         }
     ],
     "opening_themes": [
         "\"Tank!\" by The Seatbelts (eps 1-25)"
     ],
     "ending_themes": [
         "1: \"The Real Folk Blues\" by The Seatbelts feat. Mai Yamane (eps  1-12, 14-25)",
         "2: \"Space Lion\" by The Seatbelts (eps 13)",
         "3: \"Blue\" by The Seatbelts feat. Mai Yamane (eps 26)"
     ],
     "external_links": [
         {
             "name": "Official Site",
             "url": "http://www.cowboy-bebop.net/"
         }
     ]
 }
 */
