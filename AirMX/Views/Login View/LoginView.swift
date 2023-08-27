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
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "AirMX", subtitle: "Keep track of your work!", angle: 15, background:
                            Color(.airMXRed))
                
                // Login Form
                Form {
                    Section {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .textInputAutocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                        
                        AirMXButton(title: "Log In", background: Color(.airMXDarkGreen)) {
                            viewModel.login()
                        }
                        .shadow(radius: 2, x: 4, y: 4)
                    }
                }
                .frame(width: 400, height: 300)
                .shadow(radius: 5, x: 5, y: 5)
                .scrollContentBackground(.hidden)
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("New Around here?")
                    Divider()
                        .frame(width: 175)
                    NavigationLink("Create An Account") {
                        RegisterView()
                    }
                    .bold()
                }
                .foregroundColor(Color(.airMXGreen))
                .padding(.bottom, 20)
                Spacer()
            }
            .background(Color(.airMXBackground))
        }
        .tint(Color(.airMXBlack))
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
