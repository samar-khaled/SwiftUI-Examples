//
//  ColorMixerView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 03/02/2025.
//
import SwiftUI

struct ColorMixerView: View {
    @State private var fraction = 0.5

    var body: some View {
        Color.blue.mix(with: .red, by: fraction, in: .device)
            .overlay(alignment: .bottom) {
                Slider(value: $fraction, in: 0 ... 1)
            }
            .animation(.easeInOut, value: fraction)
            .frame(height: 400)
            .padding()
    }
}

#Preview {
    ColorMixerView()
}
