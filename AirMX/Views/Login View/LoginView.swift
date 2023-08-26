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
                            Color(red: 174/255, green: 32/255, blue: 18/255))
                
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
                        
                        AirMXButton(title: "Log In", background: Color(red: 0/255, green: 95/255, blue: 115/255)) {
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
                .padding(.bottom, 20)
                Spacer()
            }
            .foregroundColor(Color(red: 10/255, green: 147/255, blue: 150/255))
            .background(Color(red: 233/255, green: 216/255, blue: 166/255, opacity: 0.3))
            
        }
        .tint(Color(red: 0/255, green: 18/255, blue: 25/255))
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
