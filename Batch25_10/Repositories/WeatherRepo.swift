//
//  WeatherRepo.swift
//  Batch25_10
//
//  Created by Martin Hegel on 18.03.26.
//

import Foundation


class WeatherRepo {
    
    var API_Key = Secrets.apiWeatherKey
    
    func getWeatherFromAPI() async throws -> Weather {
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?lat=52.5&lon=13.4&appid=\(API_Key)&units=metric"
        
        guard let url = URL(string: baseURL) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Weather.self, from: data)
        
        return result
        
    }
    
    
    
}
