//
//  ViewContainerRelativeFrame.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 02/09/2025.
//

import SwiftUI

struct ViewContainerRelativeFrame: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(1 ... 10, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.yellow.gradient)
                        .overlay {
                            Text("Cell \(index)")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .containerRelativeFrame(.horizontal, alignment: .center) { length, _ in
                            length * 0.25
                        }
                        .frame(height: 120)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ViewContainerRelativeFrame()
}
