//
//  AdjustableView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 07/01/2025.
//

import SwiftUI

struct AdjustableView: View {
    var body: some View {
        VStack(spacing: 20) {
            SettingsButton()
                .border(.blue, width: 2)
            SettingsButton()
                .frame(width: 100)
                .border(.blue, width: 2)
            SettingsButton()
                .frame(width: 50)
                .border(.blue, width: 2)
        }
        .font(.system(size: 18))
        .navigationTitle("Adjustable view example")
        .padding()
    }
}

struct SettingsButton: View {
    var body: some View {
        ViewThatFits {
            Text("Open Settings")
            Text("Settings")
            Image(systemName: "gearshape")
        }
        .lineLimit(1)
    }
}

#Preview {
    AdjustableView()
}
