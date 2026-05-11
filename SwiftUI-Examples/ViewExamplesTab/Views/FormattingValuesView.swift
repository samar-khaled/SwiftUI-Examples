//
//  FormattingValuesView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 11/05/2026.
//

import SwiftUI

// https://serialcoder.dev/text-tutorials/swiftui/formatting-values-in-swiftui-text-and-textfield/
struct FormattingValuesView: View {
    let count = 12450
    let rating = 4.6789
    let progress = 0.72
    let price = 29.99
    let date = Date()

    @State private var margin = 56.0
    @State private var pageCount: Int = 120
    @State private var width: Double = 800.0
    @State private var lineHeight = 1.4
    @State private var discount = 0.15
    @State private var newPrice = 9.99

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Check Text and TextField format")
                    .font(.title)
                Text(count, format: .number.notation(.compactName))
                // Output: 12K

                Text(count, format: .number.notation(.scientific))
                // Output: 1.245E4

                Text(count, format: .number.grouping(.never))
                // Output: 12450

                Text(count, format: .number.sign(strategy: .always()))
                // Output: +12,450

                Text(count, format:
                    .number.notation(.scientific)
                        .sign(strategy: .always())
                    // Output: +1.245E4
                )
                Divider()

                Text(rating, format: .number.precision(.fractionLength(2)))
                // Output: 4.68
                Divider()
                Text(progress, format: .percent)
                // Output: 72%
                Divider()

                Text(price, format: .currency(code: "USD"))
                Text(price, format: .currency(code: "GBP"))
                Text(price, format: .currency(code: "EUR"))

                Text(price,
                     format: .currency(
                         code: Locale.current.currency?.identifier ?? "EUR"
                     )
                )
                Divider()
                Text(date, format: .dateTime)
                Text(date, format: .dateTime.day().month().year())

                Text(date, format: .dateTime.weekday().day().month())

                Text(date, format:
                    .dateTime.weekday(.wide)
                        .day(.twoDigits)
                        .month(.narrow)
                        .year())
                Text(date, format: .dateTime.hour().minute())

                let start = Date()
                let end = start.addingTimeInterval(60 * 60 * 2)

                Text(start ..< end, format: .interval.hour().minute())

                Text(start ..< end, format: .interval)

                let tomorrow = Date.now.addingTimeInterval(60 * 60 * 24)
                Text(tomorrow, format: .relative(presentation: .named))

                let futureDate = Date.now.addingTimeInterval(60 * 60 * 3)
                Text(futureDate, format: .relative(presentation: .numeric))

                Text("I'll be there \(futureDate, format: .relative(presentation: .numeric)).")

                Text(date, format: .iso8601)

                Divider()

                let temperature = Measurement(value: 23, unit: UnitTemperature.celsius)
                Text(temperature, format: .measurement(width: .abbreviated))
                Text(temperature, format: .measurement(width: .wide))

                Text(temperature, format: .measurement(width: .abbreviated))
                    .environment(\.locale, Locale(identifier: "en_US"))

                Divider()
                let distance = Measurement(value: 4.5, unit: UnitLength.kilometers)
                Text(distance, format: .measurement(width: .abbreviated))
                Text(distance, format: .measurement(width: .wide))
                Text(distance, format: .measurement(width: .abbreviated))
                    .environment(\.locale, Locale(identifier: "en_US"))

                Divider()
                let fileSize: Int64 = 2450000
                Text(fileSize, format: .byteCount(style: .file))

                Divider()

                let tags = ["iOS", "macOS", "watchOS"]

                Text(tags, format: .list(type: .and))
                Text(tags, format: .list(type: .or))

                Divider()
                let url = URL(string: "https://www.apple.com/macbook-pro")!
                Text(url, format: .url.scheme(.never))
                Text(
                    url,
                    format: .url
                        .scheme(.never)
                        .path(.never)
                )
                Text(
                    url,
                    format: .url
                        .scheme(.never)
                        .host(.never)
                )
            }
            Divider()
            VStack(spacing: 10) {

                TextField("Margin", value: $margin, format: .number)
                    .padding(.horizontal, 10)
                    .textFieldStyle(.roundedBorder)

                TextField("Page Count", value: $pageCount, format: .number).padding(.horizontal, 10)
                    .textFieldStyle(.roundedBorder)

                TextField("Width", value: $width, format: .number)
                    .padding(.horizontal, 10)
                    .textFieldStyle(.roundedBorder)

                TextField(
                    "Line Height",
                    value: $lineHeight,
                    format: .number.precision(.fractionLength(1 ... 2))
                )
                .padding(.horizontal, 10)
                .textFieldStyle(.roundedBorder)

                TextField("Discount", value: $discount, format: .percent)
                    .padding(.horizontal, 10)
                    .textFieldStyle(.roundedBorder)

                TextField("Price", value: $newPrice, format: .currency(code: "EUR"))
                    .padding(.horizontal, 10)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }
}

#Preview {
    FormattingValuesView()
}
