//
//  DetailsSheetView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 23/04/2026.
//

import SwiftUI

struct DetailsSheetView: View {
    @State private var showingBottomSheet: Bool = false
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingBottomSheet.toggle()
            }
        }
        .sheet(isPresented: $showingBottomSheet) {
            ScrollView {
                // Add content of the bottom sheet here.
            }
            .interactiveDismissDisabled()
            .presentationDetents([.height(200), .medium, .large])
            .presentationBackgroundInteraction(
                .enabled(upThrough: .large)
            )
        }
    }
}

#Preview {
    DetailsSheetView()
}
