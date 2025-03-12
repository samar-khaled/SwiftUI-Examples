//
//  GesturesTapExample.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 25/02/2025.
//

import SwiftUI

struct GesturesTapExample: View {
    var body: some View {
        VStack {
            Text("Action")
                .font(.title)
            Spacer()

            VStack(spacing: 8) {
                Label("Attention", systemImage: "alarm")
                    .font(.headline)
                Text("Something went wrong!")
            }
            .padding()
            .background(.yellow.gradient,
                        in: RoundedRectangle(cornerRadius: 8))

            Spacer()
        }
        .frame(maxHeight: 250)
        .padding()
        .border(.black, width: 4)
        .contentShape(Rectangle())
        .onTapGesture(count: 2) {
            print("doubleTap")
        }
    }
}

#Preview {
    GesturesTapExample()
}
