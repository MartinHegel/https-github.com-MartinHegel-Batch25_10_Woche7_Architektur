//
//  WeatherViewModel.swift
//  Batch25_10
//
//  Created by Martin Hegel on 18.03.26.
//

import Foundation


@Observable
@MainActor
class WeatherViewModel {
    
    private let weatherRepo = WeatherRepo()
    var weather: Weather
    var dog: String
    
    init(weather: Weather, dog: String) {
        self.weather = weather
        self.dog = dog
    }
 
    
    func fetchWeather() {
        
        Task {
            do {
                weather = try await weatherRepo.getWeatherFromAPI()
            } catch let error as HTTPError {
                print(error.message)
            } catch {
             print(error)
            }
        }
        
    }
    
    
    
}
