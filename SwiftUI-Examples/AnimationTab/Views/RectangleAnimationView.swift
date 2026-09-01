//
//  RectangleAnimationView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 01/09/2026.
//

import SwiftUI

struct RectangleAnimationView: View {
    @State private var isExpanded: Bool = true
    @State private var isAnimating: Bool = true
    @State private var isVisible: Bool = true
    @State private var hasMoved = true
    var body: some View {
        VStack(spacing: 5) {
            Button("Test") {
                isExpanded.toggle()
                isAnimating.toggle()
                isVisible.toggle()
                hasMoved.toggle()
            }
            Rectangle()
                .foregroundStyle(.red)
                .frame(width: 25, height: 25)
                .scaleEffect(isExpanded ? 2 : 1)
                .animation(.default, value: isExpanded)
                .padding()
            
            Rectangle()
                .foregroundStyle(.yellow)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(.linear(duration: 6), value: isAnimating)
            
            Rectangle()
                .foregroundStyle(.orange)
                .frame(width: 50, height: 50)
                .offset(x: isVisible ? 0 : 340)
                .animation(.easeIn(duration: 2), value: isVisible)
            
            Rectangle()
                .foregroundStyle(.blue)
                .frame(width: 50, height: 50)
                .offset(x: isVisible ? 0 : -340)
                .animation(.easeOut(duration: 2), value: isVisible)
            
            Rectangle()
                .foregroundStyle(.pink)
                .frame(width: 50, height: 50)
                .offset(y: hasMoved ? 50 : -50)
                .animation(.easeInOut(duration: 2), value: hasMoved)
            
            Rectangle()
                .foregroundStyle(.purple)
                .frame(width: 50, height: 50)
                .offset(y: hasMoved ? 50 : -50)
                .animation(
                    .timingCurve(.bezier(
                        startControlPoint: UnitPoint(x: 0.2, y: 0.8),
                        endControlPoint: UnitPoint(x: 0.8, y: 0.2)
                    ), duration: 2),
                    value: hasMoved
                )
            
            Rectangle()
                .foregroundStyle(.brown)
                .frame(width: 50, height: 50)
                .offset(y: hasMoved ? 50 : -50)
                .animation(
                    .timingCurve(.circularEaseInOut, duration: 2),
                    value: hasMoved
                )
                .padding(40)
            
            Rectangle()
                .foregroundStyle(.cyan)
                .frame(width: 50, height: 50)
                .offset(x: isVisible ? 0 : -340)
                .animation(.smooth, value: isVisible)
            
            Rectangle()
                .foregroundStyle(.green)
                .frame(width: 50, height: 50)
                .offset(x: isVisible ? 0 : -340)
                .animation(.snappy, value: isVisible)
            
            Rectangle()
                .foregroundStyle(.gray)
                .frame(width: 50, height: 50)
                .offset(x: isVisible ? 0 : -340)
                .animation(.bouncy, value: isVisible)
                
            Rectangle()
                .frame(width: 50, height: 50)
                .offset(x: isVisible ? 0 : -340)
                .animation(
                    .bouncy(duration: 0.5, extraBounce: 0.2),
                    value: isVisible
                )
            
            Rectangle()
                .frame(width: 50, height: 50)
                .offset(x: isVisible ? 0 : 340)
                .animation(.slingshot, value: isVisible)
        }
    }
}


#Preview {
    RectangleAnimationView()
}

struct SlingshotAnimation: CustomAnimation {
    let duration: TimeInterval = 0.6

    func animate<V: VectorArithmetic>(
        value: V,
        time: TimeInterval,
        context: inout AnimationContext<V>
    ) -> V? {
        guard time <= duration else { return nil }
        let t = time / duration
        let curve = t * t * (3 - 2 * t) + sin(t * .pi) * -0.3
        return value.scaled(by: curve)
    }
}

extension Animation {
    static var slingshot: Animation {
        Animation(SlingshotAnimation())
    }
}
