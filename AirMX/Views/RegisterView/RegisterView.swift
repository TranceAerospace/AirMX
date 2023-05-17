//
//  RegisterView.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewVM()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Let's get started!", angle: -15, background: .orange)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                AirMXButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
