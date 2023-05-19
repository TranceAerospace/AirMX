//
//  ProfileViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewVM: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            let decoder = Firestore.Decoder()
            do {
                let user = try decoder.decode(User.self, from: data)
                
                
                DispatchQueue.main.async {
                    self?.user = user
                    //                                User(id: data["id"] as? String ?? "",
                    //                                  name: data["name"] as? String ?? "",
                    //                                  emailAddress: data["email"] as? String ?? "",
                    //                                  joined: data["joined"] as? Timestamp ?? "")
                }
            } catch {
                print("Error decoding USER.")
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
