//
//  AnimationWithTransition.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 14/11/2024.
//
import SwiftUI

/// Reference https://x.com/AlbertMoral/status/1834304534719725608
struct AnimationWithTransition: View {
    @State private var showCard = false

    var body: some View {
        ZStack {
            VStack {
                Button(showCard ? "Hide Card" : "Show Card") {
                    withAnimation(
                        .spring(
                            response: 0.6,
                            dampingFraction: 0.8,
                            blendDuration: 0)
                    ) {
                        showCard.toggle()
                    }
                }
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)

                if showCard {
                    VStack(spacing: 5) {
                        Text("Card Shown")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                        Text("Animation")
                            .font(.system(size: 30, weight: .light, design: .rounded))
                    }
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.blue)
                            .stroke(.white, lineWidth: 4)
                    )

                    .shadow(radius: 10)
                    .padding()
                    .transition(
                        .asymmetric(
                            insertion: .opacity.combined(with: .scale),
                            removal: .move(edge: .trailing).combined(with: .opacity)
                        )
                    )
                }
            }
        }
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        .navigationTitle("Animation with Transition")
        .padding()
    }
}

#Preview {
    AnimationWithTransition()
}
