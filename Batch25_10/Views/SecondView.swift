//
//  SecondView.swift
//  Batch25_10
//
//  Created by Martin Hegel on 11.03.26.
//

import SwiftUI

struct SecondView: View {
    
    var viewModel: APIViewModel
   
    
    var body: some View {
        Text(viewModel.count, format: .number)
        
        Button("Drück mich") {
            viewModel.increment()
        }
           
    }
        
}

#Preview {
    SecondView(viewModel: APIViewModel())
}
