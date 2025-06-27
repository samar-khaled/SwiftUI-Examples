//
//  AnimationTab.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 02/04/2025.
//

import SwiftUI

struct AnimationTab: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("Slack Animations", destination: SwiftUIAnimations())

                NavigationLink("Animation with Transition", destination: AnimationWithTransition())

                NavigationLink("Snow Effect", destination: SnowView())

                NavigationLink("Card View List", destination: CardViewList())
            }
            .navigationBarTitle("Animation examples", displayMode: .inline)
        }
    }
}

#Preview {
    AnimationTab()
}
