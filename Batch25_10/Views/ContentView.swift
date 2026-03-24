//
//  ContentView.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import SwiftUI

struct ContentView: View {
    
    @State var dogViewModel: APIViewModel = APIViewModel(dogRepo: DogRepoImpl())
    @State var userViewModel: UserViewModel = UserViewModel()
    
    
    var body: some View {
        if userViewModel.isUserLoggedIn {
            TabView {
                Tab {
                    StartView(userViewModel: userViewModel)
                        .environment(dogViewModel)
                }
                Tab {
                    SettingsView()
                        .environment(dogViewModel)
                }
            }
        } else {
            LogInView(userViewModel: userViewModel)
        }
    }
}

#Preview {
    ContentView()
}
