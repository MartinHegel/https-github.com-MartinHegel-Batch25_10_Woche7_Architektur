//
//  HTTPError.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import Foundation


enum HTTPError: Error {
    case invalidURL, fetchFailed, noUser
    
    
    var message: String {
        switch self {
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Laden ist fehlgeschlagen"
        case .noUser: "Anmeldung fehlgeschlagen"
        }
    }
}
