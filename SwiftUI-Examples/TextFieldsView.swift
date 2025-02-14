//
//  TextFieldsView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 14/02/2025.
//

import SwiftUI

/// https://www.createwithswift.com/mastering-forms-in-swiftui-text-fields/

struct TextFieldsView: View {
    @State var firstName = ""
    @State var password = ""
    var body: some View {
        Form {
            Section("First Name different") {
                TextField("Enter your first name", text: $firstName, axis: .horizontal)
                    .keyboardType(.asciiCapable)
                    .scrollDismissesKeyboard(.automatic)

                TextField("Enter your first name", text: $firstName, axis: .vertical)
                    .lineLimit(2)
                    .keyboardType(.default)

                TextField(text: $firstName) {
                    Text("First Name")
                        .fontDesign(.monospaced)
                        .bold()
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.URL)
            }
            .bold()

            Section("Secure") {
                SecureField("Password", text: $password)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.twitter)
                    .onSubmit {
                        
                    }
            }
        }
    }
}

#Preview {
    TextFieldsView()
}
