//
//  ColorPickerExample.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 13/11/2024.
//

import SwiftUI

/// Reference https://x.com/AlbertMoral/status/1828868835635793994
struct ColorPickerExample: View {
    @State var color: Color = .yellow
    var body: some View {
        VStack {
            Rectangle()
                .foregroundStyle(color)
                .frame(width: 300, height: 300)
            ColorPicker("Choose a color", selection: $color)
            Spacer()
        }
        .navigationTitle("Color picker example")
        .padding()
    }
}

#Preview {
    ColorPickerExample()
}
