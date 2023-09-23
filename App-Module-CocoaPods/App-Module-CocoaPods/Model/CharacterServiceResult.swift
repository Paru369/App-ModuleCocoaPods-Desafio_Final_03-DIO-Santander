//
//  CharacterServiceResult.swift
//  App-Module-CocoaPods
//
//  Created by Paulo Pinheiro on 9/23/23.
//

import Foundation

struct CharacterServiceResult: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
}
