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
    
    
    // Variablen
    
    private let colorRepo = ColorRepo()
    private let dogRepo: DogRepository
    
    var message = ""
    var colors2: [APIColor] = []
    var dogImageString = ""
    var count = 0
    
    init(dogRepo: DogRepository) {
        self.dogRepo = dogRepo
        
    }
    
 
// Funktionen Allgemein
    
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
    
    
    
    
    // Colors Funktion
    
    func fetchColors() {
        Task {
            do {
                colors2 = try await colorRepo.getColorsFromAPI()
            } catch let error as HTTPError {
                print(error.message)
            } catch {
             print(error)
            }
        }
    }
    
    
    
    func fetchDogPic() {
        Task {
            do {
                dogImageString = try await dogRepo.getDogImage().message
            } catch {
                print(HTTPError.invalidURL)
            }
        }
    }
    
    
    func fetchDogPic(using dogRepo: DogRepository) {
        Task {
            do {
                dogImageString = try await dogRepo.getDogImage().message
            } catch {
                print(HTTPError.invalidURL)
            }
        }
    }

    
}
