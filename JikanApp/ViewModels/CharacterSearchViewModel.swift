//
//  CharacterSearchViewModel.swift
//  JikanApp
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation
import Combine
import JikanAPI

/// View Model responsible to search Characters from API.
final class CharacterSearchViewModel: SearchViewModel<JikanCharacterSearchAPI> {
    convenience init() {
        self.init(searchAPI: JikanCharacterSearchAPI())
    }
}
