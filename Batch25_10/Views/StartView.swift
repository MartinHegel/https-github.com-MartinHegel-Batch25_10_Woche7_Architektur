//
//  StartView.swift
//  Batch25_10
//
//  Created by Martin Hegel on 17.03.26.
//

import SwiftUI

struct StartView: View {
    
    var userViewModel: UserViewModel
    
    var body: some View {
      
        
        NavigationStack {
            
            NavigationLink("Hier gehts lang ->") {
                AwaitBeispielView()
            }
            
            Button("Abmelden"){
                userViewModel.loggOutUser()
            }
        
            
        }
    }
}

#Preview {
    StartView(userViewModel: UserViewModel())
}
