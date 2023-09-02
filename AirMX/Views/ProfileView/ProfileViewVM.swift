//
//  ProfileViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class ProfileViewVM {
    var user: User? = nil
    
    init() {}
    
    func getUser() {
        do {
            user = try AuthManager.shared.getAuthenticatedUser()
        } catch {
            print(error)
        }
    }
    
    func logOut() {
        do {
            try AuthManager.shared.signOut()
        } catch {
            print(error)
        }
    }
}

//MARK: - No longer used
/*
 func fetchUser() {
 guard let userId = Auth.auth().currentUser?.uid else {
 print("cannot find user")
 return
 }
 let db = Firestore.firestore()
 db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
 guard let data = snapshot?.data(), error == nil else {
 print("user not registered")
 return
 }
 
 print(data)
 let decoder = Firestore.Decoder()
 do {
 let user = try decoder.decode(User.self, from: data)
 
 
 DispatchQueue.main.async {
 self?.user = user
 // User(id: data["id"] as? String ?? "",
 // name: data["name"] as? String ?? "",
 // emailAddress: data["email"] as? String ?? "",
 // joined: data["joined"] as? Timestamp ?? "")
 }
 } catch {
 print("Error decoding USER.")
 }
 }
 }
 */
