//
//  ColorsRepo.swift
//  Batch25_10
//
//  Created by Martin Hegel on 18.03.26.
//

import Foundation


class ColorRepo {
    
    func getColorsFromAPI() async throws -> [APIColor] {
        let baseURL = "https://www.thecolorapi.com/scheme?hex=0047AB&count=3"
        
        guard let url = URL(string: baseURL) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(ColorResult.self, from: data)
        
        return result.colors
        
    }

}
