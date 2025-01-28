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
            InfoButton {
                // Do something
            }
            .labelStyle(.iconOnly)
            .font(.largeTitle)
        }
    }
}

#Preview {
    ButtonsView()
}

struct PressedButtonStyle: ButtonStyle {
    let title: String
    let systemImage: String
    let pressedImage: String

    func makeBody(configuration: Configuration) -> some View {
        let imageName = configuration.isPressed ? pressedImage : systemImage
        return Label(title, systemImage: imageName)
            .symbolEffect(.scale, isActive: configuration.isPressed)
    }
}

struct InfoButton: View {
    let action: () -> Void

    init(_ action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        Button("") {
            action()
        }
        .buttonStyle(
            PressedButtonStyle(
                title: "Info",
                systemImage: "info.circle",
                pressedImage: "info.circle.fill")
        )
        .padding()
    }
}
