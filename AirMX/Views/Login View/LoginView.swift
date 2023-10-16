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
    @State var viewModel = LoginViewVM()
    
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
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                            .submitLabel(.next)
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .textContentType(.password)
                            
                        
                        AirMXButton(title: "Log In", background: Color(.airMXDarkGreen)) {
                            Task { try await viewModel.login() }
                        }
                        .shadow(radius: 2, x: 4, y: 4)
                    
                    }
                }
                .frame(width: 400, height: 260)
                .shadow(radius: 5, x: 5, y: 5)
                .scrollContentBackground(.hidden)
                .offset(y: -50)
                
                //MARK: Temp Google Sign In Button
//                GoogleSignInButton(scheme: .light, style: .wide, state: .normal) {
//                    Task {
//                        do {
//                            try await viewModel.signInWithGoogle()
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//                .frame(width: 300)
//                .padding(.bottom, 20)
            
                
                
                // MARK: - Create Account
                VStack {
                    Text("New Around here?")
                        .foregroundColor(Color(.airMXGreen))
                    Divider()
                        .frame(width: 175)
                        .padding(.bottom, 4)
                    NavigationLink(destination: RegisterView())  {
                        Text("Create an Account")
                            .bold()
                            .padding(8)
                            .background(Color.airMXDarkGreen)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
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
