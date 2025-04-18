//
//  ResponsiveCircleView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 03/02/2025.
//

import SwiftUI

struct ResponsiveCircleView: View {
    @Environment(\.colorScheme) var colorSchema
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(Color.blue)
                .frame(width: geometry.size.width * 0.5, height: geometry.size.width * 0.5)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
        .background(Color.gray.opacity(colorSchema == .light ? 0.2 : 0.8)) // Background to see the bounds
    }
}

#Preview {
    ResponsiveCircleView()
}
