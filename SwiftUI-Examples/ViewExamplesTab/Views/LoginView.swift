//
//  LoginView.swift
//  SwiftUI-Examples
//
//  Created by Samar Khaled on 28/03/2026.
//

import SwiftUI

/// https://wesleydegroot.nl/blog/focus-state-in-swiftui
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?

    enum Field {
        case username
        case password
    }

    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)

            Button("Login") {
                focusedField = nil // Dismiss keyboard
            }
        }
        .onAppear {
            focusedField = .username
        }
    }
}

#Preview {
    LoginView()
}
