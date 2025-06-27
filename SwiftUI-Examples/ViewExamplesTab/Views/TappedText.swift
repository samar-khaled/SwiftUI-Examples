//
//  TappedText.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 14/02/2025.
//

import SwiftUI

/// https://danielsaidi.com/blog/2024/12/18/creating-a-swiftui-text-view-with-tappable-links

struct TappedText: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Hello, ") + Text("world!").foregroundStyle(.green)

            Text("Hello, hyperlink [world](https://danielsaidi.com)!")
                .foregroundStyle(.yellow)
                .tint(.orange)

            Text("Hello, bold **[world](https://danielsaidi.com)**!")
            Divider()

            PreviewText()

            PreviewText()
                .foregroundStyle(.red)
                .accentColor(.green)
            PreviewText()
                .linkTextLinkStyle(.bold)
            PreviewText()
                .linkTextLinkStyle(.italic)
            PreviewText()
                .linkTextLinkStyle(.boldItalic)
            PreviewText()
                .font(.headline.italic())
            PreviewText()
                .tint(.orange)
                .lineSpacing(10)
            
            Spacer()
        }.padding()
        
    }
}

#Preview {
    TappedText()
}

struct LinkText: View {

    init(_ components: [Component]) {
        self.components = components
    }

    private let components: [Component]

    @Environment(\.linkTextLinkStyle)
    private var linkStyle

    var body: some View {
        Text(markdownText)
    }
}

extension LinkText {

    enum Component {
        case text(String)
        case link(String, URL?, LinkText.LinkStyle? = nil)
    }
}

extension LinkText {

    struct LinkStyle {

        init(
            bold: Bool = false,
            italic: Bool = false
        ) {
            self.bold = bold
            self.italic = italic
        }

        var bold: Bool
        var italic: Bool
    }
}

extension LinkText.LinkStyle {

    static var standard: Self { .init() }
    static var bold: Self { .init(bold: true) }
    static var boldItalic: Self { .init(bold: true, italic: true) }
    static var italic: Self { .init(italic: true) }
}

extension View {

    func linkTextLinkStyle(
        _ style: LinkText.LinkStyle
    ) -> some View {
        environment(\.linkTextLinkStyle, style)
    }
}

private extension LinkText.LinkStyle {

    struct Key: EnvironmentKey {

        static var defaultValue: LinkText.LinkStyle {
            .standard
        }
    }
}

extension EnvironmentValues {

    var linkTextLinkStyle: LinkText.LinkStyle {
        get { self[LinkText.LinkStyle.Key.self] }
        set { self[LinkText.LinkStyle.Key.self] = newValue }
    }
}

private extension LinkText.Component {

    func markdown(
        _ viewStyle: LinkText.LinkStyle
    ) -> String {
        switch self {
        case let .text(text): text
        case let .link(text, url, style):
            "[\(text)](\(url?.absoluteString ?? ""))"
                .markdownBold(if: (style ?? viewStyle).bold)
                .markdownItalic(if: (style ?? viewStyle).italic)
        }
    }
}

private extension String {

    func markdownBold(if condition: Bool) -> String {
        condition ? "**\(self)**" : self
    }

    func markdownItalic(if condition: Bool) -> String {
        condition ? "*\(self)*" : self
    }
}

private extension LinkText {

    var markdownText: LocalizedStringKey {
        .init(stringLiteral: components.map {
            $0.markdown(linkStyle)
        }.joined())
    }
}

struct PreviewText: View {
    var body: some View {
        LinkText([
            .text("You must accept our "),
            .link("terms & conditions",
                  .init(string: "https://danielsaidi.com")),
            .text(". Read more on our "),
            .link("website", .init(string: "https://danielsaidi.com")),
            .text(".")
        ])
    }
}
