//
//  ViewExamplesTab.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 02/04/2025.
//

import SwiftUI

struct ViewExamplesTab: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("Color picker", destination: ColorPickerExample())

                NavigationLink("Menu", destination: MenuExample())

                NavigationLink("Adjustable view", destination: AdjustableView())

                NavigationLink("Sensitive view", destination: SensitiveView())

                NavigationLink("Buttons view", destination: ButtonsView())

                NavigationLink("Dynamic Property Example", destination: DynamicPropertyExample())

                NavigationLink("Mix Color feature", destination: ColorMixerView())

                NavigationLink("Different TextFields", destination: TextFieldsView())

                NavigationLink("Tapped Text", destination: TappedText())

                NavigationLink("Gestures Tap Example", destination: GesturesTapExample())

                NavigationLink("Table View", destination: ProjectTableView())

                NavigationLink("Stretching Header View", destination: StretchingHeaderView())

                NavigationLink("Stretchy Image", destination: StretchyImage())

                NavigationLink("Using OnGeometryChange", destination: UsingOnGeometryChange())

                NavigationLink("Using redacted for loading Views", destination: LoadingView())

                NavigationLink("List SectionActions", destination: ListWithSectionActions())

                NavigationLink("Using ContentTransition", destination: UsingContentTransition())
            }
            .navigationBarTitle("SwiftUI examples", displayMode: .inline)
        }
    }
}

#Preview {
    ViewExamplesTab()
}
