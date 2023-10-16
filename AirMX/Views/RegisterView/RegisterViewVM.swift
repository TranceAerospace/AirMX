//
//  RegisterViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
final class RegisterViewVM {
    
    var name = ""
    var email = ""
    var password = ""
    
    
    @MainActor
    func createUser() async throws {
        guard validate() else { return }
        try await AuthManager.shared.createUser(withEmail: email, password: password, name: name)
    }
    
    private func validate() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}

