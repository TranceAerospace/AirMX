//
//  RegisterView.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegisterViewVM()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Let's get started!", angle: -15, background: Color(.airMXOrange))
            
            Form {
                Section {
                    TextField("Full Name", text: $viewModel.name)
                        .foregroundStyle(.airMXBlack)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email Address", text: $viewModel.email)
                        .foregroundStyle(.airMXBlack)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .foregroundStyle(.airMXBlack)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    AirMXButton(title: "Create Account", background: Color(.airMXDarkGreen)) {
                        Task { try await viewModel.createUser() }
                    }
                    .shadow(radius: 2, x: 4, y: 4)
                }
            }
            .frame(width: 400, height: 400)
            .shadow(radius: 5, x: 5, y: 5)
            .scrollContentBackground(.hidden)
            .offset(y: -50)
            
            Spacer()
        }
        .foregroundColor(Color(.airMXGreen))
        .background(Color(.airMXBackground))
    }
}

#Preview {
    RegisterView()
}
