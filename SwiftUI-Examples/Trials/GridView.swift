//
//  GridView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 14/03/2025.
//

import SwiftUI

struct DynamicGridTest: View {
    var body: some View {
        GeometryReader { proxy in
            let count = Int(proxy.size.width / 50)
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                ForEach(0 ..< count, id: \.self) { _ in
                    GridRow {
                        ForEach(0 ..< count, id: \.self) { _ in
                            Rectangle()
                                .fill(.blue)
                                .border(.yellow, width: 2)
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            }
        }
        .clipped()
    }
}

struct GridView: View {
    @State var toggle = false
    var size: CGSize {
        toggle ? .init(width: 300, height: 300) : .init(width: 200, height: 200)
    }

    var body: some View {
        VStack {
            Button("Toggle") {
                toggle.toggle()
            }
            ZStack(alignment: .bottomTrailing) {
                Color.green.frame(width: 300, height: 300)
                DynamicGridTest()
//                    .geometryGroup()
                    .transformEffect(.identity)
                    .frame(width: size.width, height: size.height)
                    .animation(.smooth(duration: 1), value: toggle)
            }
        }
    }
}

#Preview {
    GridView()
}

