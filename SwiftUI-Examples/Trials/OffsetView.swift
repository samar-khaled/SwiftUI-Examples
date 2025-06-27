//
//  OffsetView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 14/03/2025.
//
import SwiftUI

struct OffsetView: View {
    @State var x: CGFloat = 0
    var body: some View {
        Button("Move") {
            x = x == 0 ? 200 : 0
        }
        MoveView(x: x)
            .animation(.smooth, value: x)
    }
}

struct MoveView: View, @preconcurrency Animatable {
    var x: CGFloat
    // Receive animation interpolation via animatableData
    var animatableData: CGFloat {
        get { x }
        set { x = newValue }
    }

    var body: some View {
        Rectangle()
            .foregroundStyle(.red)
            .frame(width: 100, height: 100)
            .offset(x: x)
    }
}

#Preview {
    OffsetView()
}

struct AnimationBugDemo: View {
    @State private var animate = false
    var body: some View {
        VStack {
            Text("Hello, world!")
                .animation(.default) {
                    $0
                        .opacity(animate ? 1 : 0.2)
                        .offset(y: animate ? 0 : 100) // <-- Animation anomaly
                }

//        Text("Hello, world!")
//            .animation(.default) {
//                $0
//                   .opacity(animate ? 1 : 0.2)
//                   .projectionOffset(y: animate ? 0 : 100)
//             }
            Button("Change") {
                animate.toggle()
            }
        }
    }
}

#Preview {
    AnimationBugDemo()
}

// Code from kurtlee93
public extension View {
    func projectionOffset(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        projectionOffset(.init(x: x, y: y))
    }

    func projectionOffset(_ translation: CGPoint) -> some View {
        modifier(ProjectionOffsetEffect(translation: translation))
    }
}

private struct ProjectionOffsetEffect: GeometryEffect {
    var translation: CGPoint
    var animatableData: CGPoint.AnimatableData {
        get { translation.animatableData }
        set { translation = .init(x: newValue.first, y: newValue.second) }
    }

    public func effectValue(size: CGSize) -> ProjectionTransform {
        .init(CGAffineTransform(translationX: translation.x, y: translation.y))
    }
}
