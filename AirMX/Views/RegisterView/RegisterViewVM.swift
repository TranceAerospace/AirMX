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
    
    init() {}
    
    func register() async {
        guard validate() else {
            return
        }
        do {
            let newUser = try await AuthManager.shared.createUser(email: email, password: password, name: name)
            let userID = newUser.id
            self.insertUserRecord(id: userID, name: newUser.name, email: newUser.emailAddress)
        } catch {
            print("Error registering user: \(error.localizedDescription)")
        }
    }
    
    private func insertUserRecord(id: String, name: String, email: String) {
        let newUser = User(id: id, name: name, emailAddress: email)
        
        do {
            let db = Firestore.firestore()
            
            try db.collection("users").document(id).setData(from: newUser) { error in
                if let error {
                    print("Error saving user: \(error.localizedDescription)")
                } else {
                    print("User saved successfully")
                }
            }
        } catch {
            print("Error encoding user")
        }
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

