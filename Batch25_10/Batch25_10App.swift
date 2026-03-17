//
//  Batch25_10App.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import SwiftUI

@main
struct Batch25_10App: App {
    
    
    @State var viewModel: APIViewModel = APIViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                Tab {
                    StartView()
                        .environment(viewModel)
                }
                Tab {
                    SettingsView()
                        .environment(viewModel)
                }
            }
                
        }
    }
}
