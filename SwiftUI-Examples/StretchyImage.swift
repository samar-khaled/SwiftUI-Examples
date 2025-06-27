//
//  StretchyImage.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 27/06/2025.
//

import SwiftUI

/// https://nilcoalescing.com/blog/StretchyHeaderInSwiftUI/
struct StretchyImage: View {
    var body: some View {
        ScrollView {
            VStack {
                Image(.bgPhoto)
                    .resizable()
                    .scaledToFill()
                    .stretchy()

                Text("Hello, Butterfly!")
                    .foregroundStyle(.teal)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    StretchyImage()
}

extension View {
    func stretchy() -> some View {
        visualEffect { effect, geometry in
            let currentHeight = geometry.size.height
            let scrollOffset = geometry.frame(in: .scrollView).minY
            let positiveOffset = max(0, scrollOffset)

            let newHeight = currentHeight + positiveOffset
            let scaleFactor = newHeight / currentHeight

            return effect.scaleEffect(
                x: scaleFactor, y: scaleFactor,
                anchor: .bottom
            )
        }
    }
}
