//
//  LogginView.swift
//  Batch25_10
//
//  Created by Martin Hegel on 24.03.26.
//

import SwiftUI

struct LogInView: View {
    
    @State var email: String = ""
    @State var passwort: String = ""
    
    
    var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            
            
            TextField("E-mail", text: $email)
            
            TextField("Passwort", text: $passwort)
            
            
            Button("Registrieren") {
                userViewModel.registerUser(withEmail: email, password: passwort)
            }
            Button("Anmelden") {
                userViewModel.loginUser(withEmail: email, password: passwort)
            }
            
            Button("Anonym anmelden") {
                userViewModel.loginGuest()
            }
        }
            
        
    }
}

#Preview {
    LogInView(userViewModel: UserViewModel())
}
