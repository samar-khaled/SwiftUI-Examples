//
//  UsingContentTransition.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 25/08/2025.
//

import SwiftUI

struct UsingContentTransition: View {
    @State var speed = 0
    var body: some View {
        VStack {
            Text("\(speed) KM")
                .font(.largeTitle)
                .contentTransition(.numericText())
//                .animation(.easeOut(duration: 0.5), value: speed)
                .animation(.easeIn(duration: 0.5), value: speed)
            Button("Change Speed") {
                speed += Int.random(in: 40 ... 60)
            }
        }
        .padding()
    }
}

#Preview {
    UsingContentTransition()
}
