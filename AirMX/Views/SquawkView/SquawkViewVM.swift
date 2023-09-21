//
//  SquawkViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 9/9/23.
//

import Foundation
import Observation
import FirebaseFirestore

@Observable
final class SquawkViewVM {
    
    var squawks = [SquawkModel]()
    var showingAddWorkOrder: Bool = false
    var selectedSquawkTailNumber: String?
    var showNewSquawkView = false
    var goToAddWorkOrder = false
    
    init() {
        do {
            try fetchSquawks(for: "@aci")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func showWorkOrder() {
        print("Add work order presented")
        showingAddWorkOrder = false
    }
    
//    func fetchSquawks() {
//        Task {
//            do {
//                print("fetching")
//                try SquawkModelStore.shared.getSquawks(for: "@aci")
//                squawks = SquawkModelStore.shared.squawks
//                
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    
    
    
    //Future implementation of getting squawks from Firebase
    
    
    func fetchSquawks(for organization: String) throws {
        //try SquawkModelStore.shared.getSquawks(for: organization)
        // squawks = SquawkModelStore.shared.squawks
        let db = Firestore.firestore()
        let dbRef = db.collection("squawks").document(organization).collection("squawks")
            .addSnapshotListener({ (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.squawks = documents.compactMap { queryDocumentSnapshot -> SquawkModel? in
                    return try? queryDocumentSnapshot.data(as: SquawkModel.self)
                }
                
            })
    }
    
}
