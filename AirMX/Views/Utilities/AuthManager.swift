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
    @Published var userSession: FirebaseAuth.User?
    static let shared = AuthManager()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            
        } catch {
            print("Debug failed to login user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, name: name, id: result.user.uid)
        } catch {
            print("Debug failed to create user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String, name: String, id: String) async throws {
        let user = User(id: id, name: name, email: email)
        
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
    
//    func getAuthenticatedUser() throws -> User {
//        guard let user = Auth.auth().currentUser else {
//            throw URLError(.badServerResponse)
//        }
//        return User(id: user.uid,
//                    name: user.displayName ?? "No name1 found.",
//                    emailAddress: user.email ?? "No email found.")
//        //,joined: Timestamp(date: Date()))
//    }
    
    func signOut() {
        try? Auth.auth().signOut() // signs out on firebase
        self.userSession = nil     // removes session locally and updates routing
        UserService.shared.reset() // sets current user object to nil
    }
    
}


//MARK: - Email features
extension AuthManager {
    
    
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
    
    
//    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws {
//        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
//        return try await signIn(credential: credential)
//    }
//    
//    func signIn(credential: AuthCredential) async throws {
//        let usersRef = Firestore.firestore().collection("users")
//        let authResult = try await Auth.auth().signIn(with: credential)
//        
//        if try await usersRef.whereField("users", arrayContains: authResult.user.uid).getDocuments().isEmpty {
//            let newUser = User(id: authResult.user.uid,
//                               name: authResult.user.displayName ?? "No name4 found.",
//                               emailAddress: authResult.user.email ?? "No email found.")
//            //,joined: Timestamp(date: Date()))
//            
//            do {
//                try usersRef.document(authResult.user.uid).setData(from: newUser)
//                
//            } catch {
//                print("Error saving user: \(error.localizedDescription)")
//            }
//            
//        }
}

