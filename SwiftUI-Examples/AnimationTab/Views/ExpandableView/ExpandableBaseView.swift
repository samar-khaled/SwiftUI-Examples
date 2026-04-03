//
//  ExpandableBaseView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 03/04/2026.
//
import SwiftUI

struct ExpandableBaseView<Header: View, Content: View>: View, Animatable {
    var animatableData: CGFloat

    let header: Header
    let content: Content

    @State var baseFrame: CGRect = .zero
    @State var expansionFrame: CGRect = .zero

    init(animatableData: CGFloat,
         @ViewBuilder header: () -> Header,
         @ViewBuilder content: () -> Content) {
        self.animatableData = animatableData
        self.header = header()
        self.content = content()
    }

    var expandedContent: some View {
        content
            .opacity(animatableData)
            .getFrame($expansionFrame, space: .local)
            .offset(y: baseFrame.height)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            header
                .frame(maxWidth: .infinity)
                .getFrame($baseFrame, space: .local)
                .overlay(expandedContent, alignment: .top)
        }
        .frame(height: baseFrame.height + expansionFrame.height * animatableData,
               alignment: .top)
    }
}

struct FrameMeasurePreferenceKey: @preconcurrency PreferenceKey {
    typealias Value = [String: CGRect]

    
    @MainActor static var defaultValue: Value = [:]

    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue()) { $1 }
    }
}

struct MeasureFrameViewModifier: ViewModifier {
    @Binding var frame: CGRect
    let space: CoordinateSpace
    @State private var frameId = UUID()

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .preference(
                            key: FrameMeasurePreferenceKey.self,
                            value: ["frame_\(frameId)": geometry.frame(in: space)]
                        )
                }
            )
            .onPreferenceChange(FrameMeasurePreferenceKey.self) { preferences in
                if let frame = preferences["frame_\(frameId)"] {
                    self.frame = frame
                }
            }
    }
}

extension View {
    func getFrame(_ frame: Binding<CGRect>, space: CoordinateSpace) -> some View {
        modifier(MeasureFrameViewModifier(frame: frame, space: space))
    }
}
