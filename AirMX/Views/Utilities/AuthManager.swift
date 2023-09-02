//
//  AuthManager.swift
//  AirMX
//
//  Created by Mark Trance on 8/30/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class AuthManager {
    
    static let shared = AuthManager()
    private init() {}
    
    
    func getAuthenticatedUser() throws -> User {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return User(id: user.uid,
                    name: user.displayName ?? "No display name found.",
                    emailAddress: user.email ?? "No email found.")
                    //,joined: Timestamp(date: Date()))
    }
    
    
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
}


//MARK: - Sign In Email
extension AuthManager {
    
    @discardableResult
    func createUser(email: String, password: String, name: String) async throws -> User {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        return User(id: authResult.user.uid,
                    name: name,
                    emailAddress: authResult.user.email ?? "No email found.")
                    //,joined: Timestamp(date: Date()))
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> User {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
        return User(id: authResult.user.uid,
                    name: authResult.user.displayName ?? "No display name found.",
                    emailAddress: authResult.user.email ?? "No email found.")
                    //,joined: Timestamp(date: Date()))
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    //MARK: - To update the user's password, the user must reauthenticate.
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    
    //MARK: - To update the user's email, the user must reauthenticate.
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        try await user.updateEmail(to: email)
    }
}


//MARK: - Google Sign In
extension AuthManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> User {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws -> User {
        let usersRef = Firestore.firestore().collection("users")
        let authResult = try await Auth.auth().signIn(with: credential)
        
        if try await usersRef.whereField("users", arrayContains: authResult.user.uid).getDocuments().isEmpty {
            let newUser = User(id: authResult.user.uid,
                               name: authResult.user.displayName ?? "No display name found.",
                               emailAddress: authResult.user.email ?? "No email found.")
            //,joined: Timestamp(date: Date()))
            
            do {
                try usersRef.document(authResult.user.uid).setData(from: newUser)
                //try db.collection("users").document(id).setData(from: newUser) { error in
                
            } catch {
                print("Error saving user: \(error.localizedDescription)")
            }
            
        }
        
        return User(id: authResult.user.uid,
                    name: authResult.user.displayName ?? "No display name found.",
                    emailAddress: authResult.user.email ?? "No email found.") }
                    //,joined: )    }
    
}

