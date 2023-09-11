//
//  LoginViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift

@Observable
final class LoginViewVM {
    
    var email = ""
    var password = ""
    var errorMessage = ""
    
    init() {
        
    }
    
    // Log in user with email and password
    func login() async throws {
        guard validate() else {
            return
        }
        
        // Try to log in
        try await AuthManager.shared.signInUser(email: email, password: password)
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
    
    enum AuthenticationError: Error {
        case tokenError(message: String)
    }
    
    @MainActor
    func signInWithGoogle() async throws {
        let tokens = try await SignInWithGoogleHelper().signIn()
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
        
        
    }
    
    
}
