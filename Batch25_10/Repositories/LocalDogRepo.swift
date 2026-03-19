//
//  LocalDogRepo.swift
//  Batch25_10
//
//  Created by Martin Hegel on 18.03.26.
//

import Foundation


class LocalDogRepo: DogRepository {
    
    
    func getDogImage() async throws -> DogImage {
        return DogImage(message: "https://images.dog.ceo/breeds/weimaraner/n02092339_366.jpg")
    }
    
    
}
