//
//  MenuExample.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 13/11/2024.
//
import SwiftUI

/// Reference https://jeffverkoeyen.com/blog/2024/08/16/SwiftUI-Menu-subtitle-shenanigans/
struct MenuExample: View {
    var body: some View {
        VStack(spacing: 30) {
            Menu {
                ZStack {
                    Text("Text")
                    Text("Subtitle")
                }
                Button {} label: {
                    Label("Label", systemImage: "carrot")
                }

                Button {} label: {
                    // VStack { // Menu doesn't understand VStack in this level
                    Text("Projects")
                    Text("Sub projects")
                    // }
                }

            } label: {
                Text("Filters")
            }

            // another example
            Menu {
                Button {} label: {
                    Text("Open in Preview")
                    Text("View the document in Preview")
                }
                Button { } label: {
                    Text("Save as PDF")
                    Text("Export the document as a PDF file")
                }
            } label: {
                Label("PDF", systemImage: "doc.fill")
            }

            Spacer()
        }
        .navigationTitle("Menu example")
        .padding()
    }
}

#Preview {
    MenuExample()
}
