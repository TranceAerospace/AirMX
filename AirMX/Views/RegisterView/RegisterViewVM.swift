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
class RegisterViewVM {
    
    var name = ""
    var email = ""
    var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, emailAddress: email, joined: Timestamp(date: Date()))
        
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

