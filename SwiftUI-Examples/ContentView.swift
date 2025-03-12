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

                NavigationLink("Animation with Transition", destination: AnimationWithTransition())

                NavigationLink("Snow Effect", destination: SnowView())

                NavigationLink("Adjustable view", destination: AdjustableView())

                NavigationLink("Sensitive view", destination: SensitiveView())

                NavigationLink("Buttons view", destination: ButtonsView())

                NavigationLink("Dynamic Property Example", destination: DynamicPropertyExample())

                NavigationLink("Mix Color feature", destination: ColorMixerView())

                NavigationLink("Different TextFields", destination: TextFieldsView())

                NavigationLink("Tapped Text", destination: TappedText())

                NavigationLink("Gestures Tap Example", destination: GesturesTapExample())
            }
            .navigationBarTitle("SwiftUI examples", displayMode: .inline)
        }
        .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ContentView()
}
