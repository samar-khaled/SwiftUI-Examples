//
//  StretchingHeaderView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 02/04/2025.
//

import SwiftUI

/// https://www.donnywals.com/building-a-stretchy-header-view-with-swiftui-on-ios-18/
struct StretchingHeaderView: View {
    @State private var offset: CGFloat = 0

    var body: some View {
        ZStack(alignment: .top) {
            Image(.bgPhoto)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300 + max(0, -offset))
                .clipped()
                .transformEffect(.init(translationX: 0, y: -max(0, offset)))

            ScrollView {
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 300)

                Text("\(offset)")

                LazyVStack(alignment: .leading) {
                    ForEach(0 ..< 100, id: \.self) { item in
                        Text("Item at \(item)")
                    }
                }
            }
            .onScrollGeometryChange(for: CGFloat.self, of: { geo in
                geo.contentOffset.y + geo.contentInsets.top
            }, action: { new, _ in
                offset = new
            })
        }
    }
}

#Preview {
    StretchingHeaderView()
}
