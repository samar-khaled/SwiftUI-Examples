//
//  ScrollSections.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 09/09/2025.
//

import SwiftUI

struct ScrollSections: View {
    var body: some View {
        if #available(iOS 26.0, *) {
            List {
                ForEach(["A", "B", "C", "D", "E", "F"], id: \.self) { letter in
                    Section {
                        ForEach(1 ... 5, id: \.self) {
                            Text("Item \($0)")
                        }
                    } header: {
                        Text("Section \(letter)")
                    }
                    .sectionIndexLabel(letter)
                }
                .listSectionIndexVisibility(.visible)
            }
        } else {
            Text("Only iOS 26+")
        }
    }
}

#Preview {
    ScrollSections()
}
