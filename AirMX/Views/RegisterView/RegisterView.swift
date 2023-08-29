//
//  RegisterView.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import SwiftUI

struct RegisterView: View {
    @Bindable var viewModel = RegisterViewVM()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Let's get started!", angle: -15, background: Color(.airMXOrange))
            
            Form {
                Section {
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    AirMXButton(title: "Create Account", background: Color(.airMXDarkGreen)) {
                        viewModel.register()
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
