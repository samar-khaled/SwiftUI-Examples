//
//  LinearGradientButton.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 04/02/2025.
//

import SwiftUI

struct LinearGradientButton: View {
    @State var isAnimated = false
    let gradient = Gradient(colors: [.red, .blue])
    var body: some View {
        ZStack {
            Color.black

            LinearGradient(gradient: gradient,
                           startPoint: isAnimated ? .topTrailing : .bottomLeading,
                           endPoint: isAnimated ? .bottomTrailing : .center)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimated)
                .frame(width: 280, height: 86)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .blur(radius: 8)

            Button("Button") {}
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 280, height: 80)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .ignoresSafeArea()
        .onAppear {
            isAnimated.toggle()
        }
    }
}

#Preview {
    LinearGradientButton()
}
