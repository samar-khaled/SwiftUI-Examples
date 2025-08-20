//
//  LoadingView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 20/08/2025.
//

import SwiftUI

struct LoadingView: View {
    @State var isLoading = true
    var body: some View {
        VStack(spacing: 20) {
            Text("Check is loading")
            Text("Still Checking")
        }
        .font(.largeTitle)
        .padding()
        .redacted(reason: isLoading ? .placeholder : [])
        .foregroundColor(.orange)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isLoading = false
            }
        }
    }
}

#Preview {
    LoadingView()
}
