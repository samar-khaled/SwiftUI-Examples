//
//  DynamicPropertyExample.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 03/02/2025.
//

import SwiftUI

struct DynamicPropertyExample: View {
    @Uppercase var name = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Your name is \(name)")
            TextField("Enter your name: ", text: $name)
        }
        .padding()

        Spacer()
    }
}

@propertyWrapper
struct Uppercase: DynamicProperty {
    @State var wrappedValue: String

    var projectedValue: Binding<String> {
        Binding {
            wrappedValue
        } set: { new in
            wrappedValue = new.uppercased()
        }
    }
}

#Preview {
    DynamicPropertyExample()
}
