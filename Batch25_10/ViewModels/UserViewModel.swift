//
//  UseViewModel.swift
//  Batch25_10
//
//  Created by Martin Hegel on 24.03.26.
//

import Foundation
import FirebaseAuth


@Observable
@MainActor
class UserViewModel {
    
    private let auth = Auth.auth()
    var user: User?
    
    var isUserLoggedIn: Bool {
        user != nil
    }
    
    
    func loginGuest() {
        Task {
            do {
                let result = try await self.auth.signInAnonymously()
                self.user = result.user
            } catch {
                print(HTTPError.noUser)
            }
        }
    }
    
    
    func loggOutUser() {
        self.user = nil
    }
    
}
