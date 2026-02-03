//
//  Counter.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 03/02/2026.
//

import SwiftUI

@Observable
class CounterData {
    var value = 0
}

struct Counter: View {
//    @State private var value = 0

    var data = CounterData()
    var body: some View {
        VStack(spacing: 20) {
            Button("Increment: \(data.value)") {
                data.value += 1
            }
            .background(Color.random)

            SubView()
        }
    }
}

struct SubView: View {
    var body: some View {
        Text("Hellooo")
            .background(Color.random)
    }
}

extension Color {
    static var random: Color {
        .init(
            red: .random(in: 0 ... 1),
            green: .random(in: 0 ... 1),
            blue: .random(in: 0 ... 1)
        )
    }
}

#Preview {
    Counter()
}
