//
//  APIViewModel.swift
//  Batch25_10
//
//  Created by Martin Hegel on 16.03.26.
//

import Foundation


@Observable
@MainActor
class APIViewModel {
    
    var message = ""
    var colors2: [APIColor] = []
    var dogImageString = ""
    var count = 0
    
    init() {}

    
    func increment() {
            count += 1
        }

    
    
    
    func receiveMessage() async {
        for i in 1...10 {
            do {
                try await Task.sleep(for: .seconds(1))
                message += "Nachricht \(i)"
            } catch {
            print(error)
            }
            
        }
    }
    
    
    
    func getColorsFromAPI() async throws -> [APIColor] {
        let baseURL = "https://www.thecolorapi.com/scheme?hex=0047AB&count=3"
        
        guard let url = URL(string: baseURL) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(ColorResult.self, from: data)
        
        return result.colors
        
    }
    
    func fetchColors() {
        Task {
            do {
                colors2 = try await getColorsFromAPI()
            } catch let error as HTTPError {
                print(error.message)
            } catch {
             print(error)
            }
        }
    }
    
    private func getDogImage() async throws -> DogImage {
        let baseURL = "https://dog.ceo/api/breeds/image/random"
        
        guard let url = URL(string: baseURL) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(DogImage.self, from: data)
        
        
        return result
        
    }
    
    func fetchDogPic() {
        Task {
            do {
                dogImageString = try await getDogImage().message
            } catch {
                print(HTTPError.invalidURL)
            }
        }
    }
    
    
    var weatherAPIKey = "1223344"
    
    func getWeatherFromAPI() async throws -> Weather {
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?lat=52.5&lon=13.4&appid=\(Secrets.apiWeatherKey)&units=metric"
        
        guard let url = URL(string: baseURL) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(Weather.self, from: data)
        
        return result
        
    }
    
    
    func TestFunc() {
        
    }

    
    
    
    
}
