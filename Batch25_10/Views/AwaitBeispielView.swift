//
//  AwaitBeispiel.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import SwiftUI

struct AwaitBeispielView: View {
    
    @Environment(APIViewModel.self) var viewModel
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                
                Text(viewModel.count, format: .number)
                
                Button("Drücken") {
                    viewModel.increment()
                    print(viewModel.dogImageString)
                }
                
                
                Text("Hier ist die überschrift")
                
                Text(viewModel.message)
                
                NavigationLink("Hier gehts lang ->") {
                    SecondView(viewModel: viewModel)
                
                }
                
                Text("Colors: \(viewModel.colors2)")
                
                AsyncImage(url: URL(string: viewModel.dogImageString)) { image in
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
                
                
            }
            .padding()
            .onAppear {
                Task {
                    await viewModel.receiveMessage()
                }
                viewModel.fetchColors()
                viewModel.fetchDogPic()
                
            }
        }
    }
}

#Preview {
    AwaitBeispielView()
        .environment(APIViewModel(dogRepo: LocalDogRepo()))
}
