//
//  RectangleColorAnimationView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 01/09/2026.
//

import SwiftUI

struct RectangleColorAnimationView: View {
    @State private var color = Color.brown

    var body: some View {
        Button("Change color") {
            withAnimation(.easeInOut) {
                color = color == .brown ? .mint : .brown
            }
        }
        .padding(20)
        .background(color)
        .foregroundStyle(.white)
        .padding()

       
        Button("Change color") {
            color = color == .brown ? .mint : .brown
        }
        .padding(20)
        .background(color)
        .foregroundStyle(.white)
        .animation(.easeInOut, value: color)
    }
}

#Preview {
    RectangleColorAnimationView()
}
