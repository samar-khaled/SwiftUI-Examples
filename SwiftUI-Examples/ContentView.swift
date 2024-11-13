//
//  ContentView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 13/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("Color picker example", destination: ColorPickerExample())
            }
            .navigationBarTitle("SwiftUI examples", displayMode: .inline)
        }
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
