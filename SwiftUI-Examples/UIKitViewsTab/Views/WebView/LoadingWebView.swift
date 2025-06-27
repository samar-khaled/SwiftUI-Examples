//
//  LoadingWebView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 27/06/2025.
//

import SwiftUI

/// https://www.swiftyplace.com/blog/loading-a-web-view-in-swiftui-with-wkwebview
struct LoadingWebView: View {
    @State private var isLoading = true
    @State private var error: Error? = nil
    let url: URL?

    var body: some View {
        ZStack {
            if let error = error {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
            } else if let url = url {
                MyWebView(
                    url: url,
                    isLoading: $isLoading,
                    error: $error
                )
                
                if isLoading {
                    ProgressView()
                }
            } else {
                Text("Sorry, we could not load this url.")
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    LoadingWebView(url: URL(string: "https://www.apple.com")!)
}
