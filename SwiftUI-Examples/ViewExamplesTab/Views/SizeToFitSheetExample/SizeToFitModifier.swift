//
//  SizeToFitModifier.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 01/06/2026.
//
import SwiftUI

// https://danielsaidi.com/blog/2026/05/22/making-a-swiftui-sheet-automatically-size-to-fit-its-content

enum SizeToFitPresentationDetent {
    case sizeToFit
}

struct SizeToFitModifier: ViewModifier {

    let additional: Set<PresentationDetent>

    @State private var contentHeight = 0.0

    func body(content: Content) -> some View {
        content
            .onGeometryChange(for: CGFloat.self) {
                $0.size.height
            } action: { height in
                contentHeight = height
            }
            .presentationDetents(Set([.height(contentHeight)]).union(additional))
    }
}

extension View {

    /// Sets the sheet detent to fit its content height.
    func presentationDetents(
        _ detent: SizeToFitPresentationDetent,
        additional: Set<PresentationDetent> = []
    ) -> some View {
        modifier(SizeToFitModifier(additional: additional))
    }
}
