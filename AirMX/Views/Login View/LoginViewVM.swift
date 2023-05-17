//
//  LoginViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import Foundation
import FirebaseAuth

class LoginViewVM: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try to log in
        Auth.auth().signIn(withEmail: email, password: password)
        
        
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields"
            
            return false
        }
        
        // valid email
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
