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

            LinearGradientButton()

            Spacer()

            VStack(spacing: 16) {
                Label("Favorite", systemImage: "star")
                    .labelStyle(AdaptiveLabelStyle())

                Label("Favorite", systemImage: "star")
                    .labelStyle(.adaptive)

                Button("Start", systemImage: "play.circle") {}
                    .buttonStyle(CapsuleButtonStyle(.orange))

                Button("Start", systemImage: "play.circle") {}
                    .buttonStyle(.capsule(.yellow))
            }
        }
    }
}

#Preview {
    ButtonsView()
}

struct AdaptiveLabelStyle: LabelStyle {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    func makeBody(configuration: Configuration) -> some View {
        if horizontalSizeClass == .compact {
            VStack {
                configuration.icon
                configuration.title
            }
        } else {
            Label(configuration)
        }
    }
}

extension LabelStyle where Self == AdaptiveLabelStyle {
    static var adaptive: AdaptiveLabelStyle {
        AdaptiveLabelStyle()
    }
}

struct CapsuleButtonStyle: ButtonStyle {
    let color: Color

    init(_ color: Color) {
        self.color = color
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(.black)
            .background(color, in: Capsule())
            .fontDesign(.monospaced)
            .symbolVariant(configuration.isPressed ? .fill : .none)
    }
}

extension ButtonStyle where Self == CapsuleButtonStyle {
    static func capsule(_ color: Color) -> CapsuleButtonStyle {
        CapsuleButtonStyle(color)
    }
}
