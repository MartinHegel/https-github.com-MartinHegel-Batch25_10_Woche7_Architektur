//
//  DogRepo.swift
//  Batch25_10
//
//  Created by Martin Hegel on 18.03.26.
//

import Foundation


class DogRepoImpl: DogRepository {
    
   func getDogImage() async throws -> DogImage {
        let baseURL = "https://dog.ceo/api/breeds/image/random"
        
        guard let url = URL(string: baseURL) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(DogImage.self, from: data)
        
        
        return result
        
    }
    
    
}
