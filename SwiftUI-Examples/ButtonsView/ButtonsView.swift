//
//  ButtonsView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 28/01/2025.
//

import SwiftUI

struct ButtonsView: View {
    var body: some View {
        VStack {
            Text("Changing the icon when pressed with animation")
                .multilineTextAlignment(.leading)
                .font(.title)
                .padding()

            InfoButton {}
                .labelStyle(.iconOnly)
                .font(.largeTitle)

            Divider()

            Text("Custom ButtonStyle")
                .multilineTextAlignment(.leading)
                .font(.title)

            PrimaryButtonStyleView()

            Divider()

            Spacer()
        }
    }
}

#Preview {
    ButtonsView()
}
