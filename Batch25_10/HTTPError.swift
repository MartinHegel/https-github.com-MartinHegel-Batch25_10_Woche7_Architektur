//
//  HTTPError.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import Foundation


enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    
    var message: String {
        switch self {
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Laden ist fehlgeschlagen"
        }
    }
}
