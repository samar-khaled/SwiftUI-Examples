//
//  OpenSizeToFitSheetView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 01/06/2026.
//

import SwiftUI

struct OpenSizeToFitSheetView: View {

    @State var isPresented = false
    var body: some View {
        VStack {
            Button("Open Sheet") {
                isPresented.toggle()
            }
        }
        .sheet(isPresented: $isPresented) {
            MySheet()
                .presentationDetents(.sizeToFit, additional: [.medium, .large])
        }
    }
}

struct MySheet: View {
    var body: some View {
        Text("My Sheet")
            .padding(30)
    }
}

#Preview {
    OpenSizeToFitSheetView()
}
