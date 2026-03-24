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
class UserViewModel{
    
    init() {
        self.checkAuth()
    }
    
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
  

    private func checkAuth() {
        guard let currentUser = self.auth.currentUser else {
            print("Not logged in")
            return
        }
        
        self.user = currentUser
    }

    func registerUser(withEmail email: String, password: String) {
        Task {
            do {
                let result = try await self.auth.createUser(withEmail: email, password: password)
                self.user = result.user
            } catch {
              
                print(HTTPError.noUser)
            }
        }
    }
    
    func loginUser(withEmail email: String, password: String) {
        Task {
            do {
                let result = try await self.auth.signIn(withEmail: email, password: password)
                self.user = result.user
            } catch {
                print(HTTPError.noUser)
            }
        }
    }

    
    
    
    func logOutUser() {
        do {
            try self.auth.signOut()
            self.user = nil
            print("User wurde abgemeldet!")
        } catch {
            print(HTTPError.noUser)
        }
    }

    
}
