//
//  AnimeType.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

public enum AnimeType: String, Decodable {
    case tv = "TV"
    case ova = "OVA"
    case movie = "Movie"
    case special = "Special"
    case ona = "ONA"
    case music = "Music"
}
