//
//  ProfileViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@Observable
class ProfileViewVM {
    var user: User? = nil
    var name: String = ""
    var email: String = ""
    var organization: String = ""
    var isEditing: Bool = false
    
    init() {
    }
    
    /*
     func getUser() {
     do {
     user = try AuthManager.shared.getAuthenticatedUser()
     
     name = user?.name ?? ""
     email = user?.emailAddress ?? ""
     organization = user?.organization ?? ""
     
     } catch {
     print(error)
     }
     }
     */
    
    func logOut() {
        do {
            try AuthManager.shared.signOut()
        } catch {
            print(error)
        }
    }
    
    func updateProfile(name displayName: String, organization: String) async throws {
        let db = Firestore.firestore()
        let dbRef = db.collection("users").document(user?.id ?? "")
        do {
            try await dbRef.updateData([
                "displayName": displayName,
                "organization": organization
            ])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    
    
    //MARK: - No longer used
    
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
                    self?.name = user.name
                    self?.email = user.emailAddress
                    self?.organization = user.organization
                    //                    User(id: data["id"] as? String ?? "",
                    //                    name: data["displayName"] as? String ?? "",
                    //                    emailAddress: data["email"] as? String ?? "",
                    //                    organization: data["organization"] as? String ?? "")
                }
            } catch {
                print("Error decoding USER.")
            }
        }
    }
    
}
