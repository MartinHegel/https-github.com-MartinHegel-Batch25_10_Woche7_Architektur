//
//  DogProtocol.swift
//  Batch25_10
//
//  Created by Martin Hegel on 18.03.26.
//

import Foundation


protocol DogRepository {
    func getDogImage() async throws -> DogImage
}
