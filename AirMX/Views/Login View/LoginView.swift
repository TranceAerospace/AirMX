//
//  LoginView.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import SwiftUI

struct LogInView: View {
    
    @StateObject var viewModel = LoginViewVM()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "AirMX", subtitle: "Keep track of your work!", angle: 15, background: .pink)
                
                // Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    AirMXButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }
                .offset(y: -50)
                
                
                // Create Account
                VStack {
                    Text("New Around here?")
                    
                    NavigationLink("Create An Account") {
                        RegisterView()
                    }
                }
                .padding(.bottom, 20)
                Spacer()
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
