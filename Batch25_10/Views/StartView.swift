//
//  StartView.swift
//  Batch25_10
//
//  Created by Martin Hegel on 17.03.26.
//

import SwiftUI

struct StartView: View {
    var body: some View {
      
        
        NavigationStack {
            
            NavigationLink("Hier gehts lang ->") {
                AwaitBeispielView()
            }
            
        }
    }
}

#Preview {
    StartView()
}
