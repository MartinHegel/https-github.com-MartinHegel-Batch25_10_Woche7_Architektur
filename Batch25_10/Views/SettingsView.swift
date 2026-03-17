//
//  SettingsView.swift
//  Batch25_10
//
//  Created by Martin Hegel on 17.03.26.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(APIViewModel.self) var viewModel
    var body: some View {
        Text(viewModel.count, format: .number)
    }
}

#Preview {
    SettingsView()
}
