//
//  ExpandingAnimationsView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 03/04/2026.
//

import SwiftUI
// https://nerdyak.tech/development/2026/03/16/expand-animation-in-SwiftUI-List.html

struct ExpandingAnimationsView: View {
    var body: some View {
        List {
            Text("Test")
                .listRowSeparator(.hidden)
            TypicalExpandableView()
                .listRowSeparator(.hidden)
            TweakedExpandableView()
                .listRowSeparator(.hidden)
            DisclosureExpandableView()
                .listRowSeparator(.hidden)

            AnimatableExpandableView()
                .listRowSeparator(.hidden)
            
            WorkingExpandableView()
                .listRowSeparator(.hidden)
            Text("End of test")
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct WorkingExpandableView: View {
    @State private var isExpanded = false

    var body: some View {
        ExpandableBaseView(
            animatableData: isExpanded ? 1 : 0,
            header: {
                TitleView()
                    .onTapGesture {
                        withAnimation() {
                            isExpanded.toggle()
                        }
                    }
            },
            content: {
                DetailView()
            }
        )
        .background(Color.yellow)
        .cornerRadius(8)
    }
}

struct AnimatableRedBox: View, Animatable {
    var animatableData: CGFloat

    var body: some View {
        Color.red
            .frame(height: animatableData)
    }
}

struct AnimatableExpandableView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TitleView()
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }

            AnimatableRedBox(animatableData: isExpanded ? 100 : 0)
        }
        .background(Color.green)
        .cornerRadius(8)
        .id("static")
    }
}

struct DisclosureExpandableView: View {
    @State private var isExpanded = false

    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                DetailView()
            },
            label: {
                TitleView()
            }
        )
        .background(Color.cyan)
        .cornerRadius(8)
    }
}

struct TweakedExpandableView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TitleView()
                .onTapGesture {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }

            if isExpanded {
                Divider()
                DetailView()
                    .transition(.opacity)
            }
        }
        .background(Color.blue)
        .cornerRadius(8)
        .id("static")
    }
}

struct TypicalExpandableView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TitleView()
                .onTapGesture {
                    isExpanded.toggle()
                }

            if isExpanded {
                Divider()
                DetailView()
                    .transition(.opacity)
            }
        }
        .background(Color.gray)
        .cornerRadius(8)
        .animation(.default, value: isExpanded)
    }
}

struct TitleView: View {
    var body: some View {
        Text("Tap to expand/collapse")
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .contentShape(Rectangle())
    }
}

struct DetailView: View {
    var body: some View {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
            .font(.body)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
    }
}

#Preview {
    ExpandingAnimationsView()
}
