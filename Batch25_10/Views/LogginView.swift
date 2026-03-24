//
//  LogginView.swift
//  Batch25_10
//
//  Created by Martin Hegel on 24.03.26.
//

import SwiftUI

struct LogginView: View {
    
    var userViewModel: UserViewModel
    
    var body: some View {
        
        Button("Anonym anmelden") {
            userViewModel.loginGuest()
        }
        
        
    }
}

#Preview {
    LogginView(userViewModel: UserViewModel())
}
