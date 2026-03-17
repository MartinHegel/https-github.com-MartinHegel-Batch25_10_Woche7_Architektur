//
//  ResultColors.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import Foundation

struct ColorResult: Codable {
    var colors: [APIColor]
}

struct APIColor: Codable {
    var hex: HexCode
}

struct HexCode: Codable {
    var value: String
}



