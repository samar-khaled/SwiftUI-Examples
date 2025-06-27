//
//  UIKitViewsTab.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 27/06/2025.
//

import SwiftUI

struct UIKitViewsTab: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("Using WKWebView", destination:  LoadingWebView(url: URL(string: "https://www.apple.com")!))
            }
            .navigationBarTitle("UIKit views examples", displayMode: .inline)
        }
    }
}

#Preview {
    UIKitViewsTab()
}
