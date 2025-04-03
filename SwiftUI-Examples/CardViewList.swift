//
//  CardViewList.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 14/03/2025.
//
import SwiftUI

/// https://www.createwithswift.com/symmetrical-and-asymmetrical-transitions-in-swiftui-with-the-scroll-transition-modifier
struct CardViewList: View {

    var body: some View {
        // The scrolling container
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(0 ..< 10) { index in
                    ColorView(index: index)
                        .frame(height: 200)

//                        .scrollTransition(
//                            .interactive(timingCurve: .easeInOut),
//                            axis: .vertical
//                        ) { content, phase  in
//                            let scaledContent = content.scaleEffect(phase.isIdentity ? 1 : -0.2 * phase.value)
//
//                            return scaledContent
//                        }
                        .scrollTransition(
                            // The topLeading configuration
                            topLeading: .interactive(timingCurve: .easeIn),
                            // The bottomTrailing configuration
                            bottomTrailing: .animated(.bouncy(duration: 0.8)),
                            // The axis
                            axis: .vertical
                        ) { content, phase in
                            content
                                // The transition for the topLeading configuration
                                .rotationEffect(.degrees(phase == .topLeading ? -90 * phase.value : 0))
                                // The transition for the bottomTrailing configuration
                                .scaleEffect(phase == .bottomTrailing ? 1 + 0.5 * phase.value : 1)
                                // Fading in and out
                                .opacity(1 - phase.value)
                        }
                }
            }
            .padding()
        }
    }
}

struct ColorView: View {
    let index: Int

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(colorForIndex(index))
            .overlay(
                Text("Item \(index + 1)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            )
    }

    func colorForIndex(_ index: Int) -> Color {
        let colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple, .pink, .teal, .cyan, .brown]
        return colors[index % colors.count]
    }
}

#Preview {
    CardViewList()
}
