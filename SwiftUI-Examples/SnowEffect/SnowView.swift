//
//  SnowView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 04/01/2025.
//

import SpriteKit
import SwiftUI

struct SnowView: View {
    var scene: SKScene {
        let scene = SnowScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }

    var body: some View {
        SpriteView(scene: scene, options: [.allowsTransparency])
            .ignoresSafeArea()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .navigationTitle("Snow example")
            .background(Color.black)
    }
}

#Preview {
    SnowView()
}
