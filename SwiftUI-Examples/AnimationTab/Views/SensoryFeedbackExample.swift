//
//  SensoryFeedbackExample.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 31/08/2026.
//

import SwiftUI

struct SensoryFeedbackExample: View {
    enum Priority: String, CaseIterable {
        case low, normal, high
    }

    @State private var priority: Priority = .normal

    var body: some View {
        Picker("Priority", selection: $priority) {
            ForEach(Priority.allCases, id: \.self) { priority in
                Text(priority.rawValue.capitalized).tag(priority)
            }
        }
        .sensoryFeedback(.selection, trigger: priority)
    }
}

#Preview {
    SensoryFeedbackExample()
}
