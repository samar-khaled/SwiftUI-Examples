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

                NavigationLink("ExpandingAnimationsView", destination: ExpandingAnimationsView())

                NavigationLink("Sensory Feedback Example", destination: SensoryFeedbackExample())
                
                NavigationLink("Rectangle Animation View", destination: RectangleAnimationView())
                
                NavigationLink("Rectangle Color Animation View", destination: RectangleColorAnimationView())
            }
            .navigationBarTitle("Animation examples", displayMode: .inline)
        }
    }
}

#Preview {
    AnimationTab()
}
