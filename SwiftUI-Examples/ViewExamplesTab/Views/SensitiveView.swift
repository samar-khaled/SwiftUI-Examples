//
//  SensitiveView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 27/01/2025.
//

import SwiftUI

struct SensitiveView: View {

    @Environment(\.scenePhase) var scencePhase
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("This is a sensitive info")
                .font(.title)
//                .privacySensitive()
                .blurWhenNotActive()
        }
        .padding()
    }
}

struct BlurView: ViewModifier {
    @Environment(\.scenePhase) var scencePhase

    func body(content: Content) -> some View {
        content
            .blur(radius: scencePhase != .active ? 10 : 0)
            .animation(.default, value: scencePhase)
    }
}

extension View {
    func blurWhenNotActive() -> some View {
        modifier(BlurView())
    }
}

#Preview {
    SensitiveView()
}
