//
//  ContentView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 13/11/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSize
    var body: some View {
        TabView {
            Tab("Main", systemImage: "house") {
                ViewExamplesTab()
            }

            Tab("Animation Views", systemImage: "swift") {
                AnimationTab()
            }

            Tab("UIKit Views", systemImage: "moon") {
                UIKitViewsTab()
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
