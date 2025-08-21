//
//  ListWithSectionActions.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 21/08/2025.
//

import SwiftUI

struct ListWithSectionActions: View {
    var body: some View {
        List {
            Section("CheckList") {
                Text("Drink Water")
                Text("Have Breakfast")
            }
            .sectionActions {
                Button("Add", systemImage: "plus") {}
            }

            Section("Afternoon checklist") {
                Text("Drink more water")
                Text("Have diner")
            }
            .sectionActions {
                Button("Back home", systemImage: "house") {}
            }
        }
    }
}

#Preview {
    ListWithSectionActions()
}
