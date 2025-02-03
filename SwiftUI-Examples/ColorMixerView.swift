//
//  ColorMixerView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 03/02/2025.
//
import SwiftUI

struct ColorMixerView: View {
    @State private var fraction = 0.05
    @State private var startColor = Color.blue
    @State private var mixedColor = Color.red

    var body: some View {

        VStack {
            ColorPicker("Start Color", selection: $startColor)
                .font(.headline)
                .padding()
            ColorPicker("Mixed Color", selection: $mixedColor)
                .font(.headline)
                .padding()

            Slider(value: $fraction, in: 0 ... 1)

            startColor.mix(with: mixedColor, by: fraction, in: .device)
                .animation(.easeInOut, value: fraction)
                .frame(height: 300)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ColorMixerView()
}
