//
//  UsingOnGeometryChange.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 17/08/2025.
//

import SwiftUI

/// Article https://nemecek.be/blog/208/getting-view-size-in-swiftui-without-geometryreader
struct UsingOnGeometryChange: View {
    @State private var contentHeight: CGFloat = 0
    @State private var showsSheet = false
    @State private var fontSize: CGFloat = 50

    var body: some View {
        VStack(spacing: 20) {
            Text("onGeometryChange example")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            Button {
                fontSize = CGFloat.random(in: 30 ... 80)

                showsSheet = true
            } label: {
                Text("Show sheet")
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .sheet(isPresented: $showsSheet) {
            VStack {
                Text("As you can see this sheet is dynamically sized to fit this content.")
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .font(.system(size: fontSize))
            }
            .onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: {
                self.contentHeight = $0.height
                // Alternatively you can get the `width` here
            }
            .presentationDetents([.height(contentHeight)])
        }
    }
}

#Preview {
    UsingOnGeometryChange()
}
