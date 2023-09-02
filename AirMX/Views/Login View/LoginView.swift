//
//  LoginView.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct LogInView: View {
    
    @Bindable var viewModel = LoginViewVM()
    
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
                            Task {
                                do {
                                    try await viewModel.login()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                        .shadow(radius: 2, x: 4, y: 4)
                    
                    }
                }
                .frame(width: 400, height: 260)
                .shadow(radius: 5, x: 5, y: 5)
                .scrollContentBackground(.hidden)
                .offset(y: -50)
                
                //MARK: Temp Google Sign In Button
                GoogleSignInButton(scheme: .light, style: .wide, state: .normal) {
                    Task {
                        do {
                            try await viewModel.signInWithGoogle()
                        } catch {
                            print(error)
                        }
                    }
                }
                .frame(width: 300)
            
                
                
                // MARK: - Create Account
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


#Preview {
    LogInView(viewModel: LoginViewVM())
}
