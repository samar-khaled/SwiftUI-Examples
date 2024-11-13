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
                NavigationLink("Color picker", destination: ColorPickerExample())

                NavigationLink("Animations", destination: SwiftUIAnimations())
                
                NavigationLink("Menu", destination: MenuExample())
            }
            .navigationBarTitle("SwiftUI examples", displayMode: .inline)
        }
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
