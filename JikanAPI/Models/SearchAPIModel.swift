//
//  SearchAPIModel.swift
//  JikanAPI
//
//  Created by Dmitry Borodin on 11.11.2021.
//

import Foundation

public protocol SearchAPIModel: Decodable {
    associatedtype IDType
    
    var id: IDType { get }
}
