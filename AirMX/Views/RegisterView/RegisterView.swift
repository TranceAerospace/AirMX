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
            HeaderView(title: "Register", subtitle: "Let's get started!", angle: -15, background: Color(red: 202/255, green: 103/255, blue: 2/255))
            
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
                    
                    AirMXButton(title: "Create Account", background: Color(red: 0/255, green: 95/255, blue: 115/255)) {
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
        .foregroundColor(Color(red: 10/255, green: 147/255, blue: 150/255))
        .background(Color(red: 233/255, green: 216/255, blue: 166/255, opacity: 0.3))
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
