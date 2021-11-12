//
//  Character.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

public struct Character: APIModel {
    public let id: Int
    public let url: String
    public let name: String
    public let nameKanji: String
    public let nicknames: [String]
    public let about: String
    public let imageURL: URL
}

extension Character {
    private enum CodingKeys: String, CodingKey {
        case id = "mal_id"
        case url = "url"
        case name = "name"
        case nameKanji = "name_kanji"
        case nicknames = "nicknames"
        case about = "about"
        case imageURL = "image_url"
    }
}

// TODO: Add fields
/*
     "animeography": [
         {
             "mal_id": 1,
             "name": "Cowboy Bebop",
             "url": "https://myanimelist.net/anime/1/Cowboy_Bebop",
             "image_url": "https://cdn.myanimelist.net/images/anime/4/19644.jpg?s=42d7666179a2851c99fada2e0ceb5da1",
             "role": "Main"
         }
     ]
     "mangaography": [
         {
             "mal_id": 173,
             "name": "Cowboy Bebop",
             "url": "https://myanimelist.net/manga/173/Cowboy_Bebop",
             "image_url": "https://cdn.myanimelist.net/images/manga/5/166652.jpg?s=11de80d1d5c75e063332dbe842bf9dd2",
             "role": "Main"
         }
     ],
     "voice_actors": [
         {
             "mal_id": 11,
             "name": "Yamadera, Kouichi",
             "url": "https://myanimelist.net/people/11/Kouichi_Yamadera",
             "image_url": "https://cdn.myanimelist.net/images/voiceactors/3/60992.jpg",
             "language": "Japanese"
         }
 
 */
