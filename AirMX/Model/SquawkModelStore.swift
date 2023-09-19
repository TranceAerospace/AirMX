//
//  SquawkModelStore.swift
//  AirMX
//
//  Created by Mark Trance on 9/10/23.
//

import Foundation
import FirebaseFirestore
import Observation

@Observable
final class SquawkModelStore {
    var squawks = [SquawkModel]()
    
    static let shared = SquawkModelStore()
    private init() {}
    
    func addSquawk(_ squawk: SquawkModel) async throws {
        squawks.append(squawk)
        
        do {
            try await saveSquawk(squawk)
            try getSquawks(for: squawk.organization)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func getSquawks(for organization: String) throws {
        let db = Firestore.firestore()
        let dbRef = db.collection("squawks").document(organization).collection("squawks")
            .addSnapshotListener({ (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                print(self.squawks.count)
                self.squawks = documents.compactMap { queryDocumentSnapshot -> SquawkModel? in
                    return try? queryDocumentSnapshot.data(as: SquawkModel.self)
                }
            })
    }
    
    
    
    func saveSquawk(_ squawk: SquawkModel) async throws {
        let db = Firestore.firestore()
        let dbRef = db.collection("squawks").document(squawk.organization).collection("squawks").document(squawk.id)
        do {
            try dbRef.setData(from: squawk)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /*func save() {
     // MARK: - Not used
     guard canSave else {
     return
     }
     
     // Get user id
     guard let uId = Auth.auth().currentUser?.uid else {
     return
     }
     
     //Create a model
     let newId = UUID().uuidString
     let newItem = AircraftWorkOrder(id: newId, hobbs: aircraftHobbs, cycles: aircraftCycles, tailNumber: tailNumber, datePerformed: Timestamp(date: Date()), workNotes: workNotes, parts: parts)
     
     //Save model
     do {
     let db = Firestore.firestore()
     try db.collection("users").document(uId).collection("workOrders").document(newId).setData(from: newItem){ error in
     if let error {
     print("Error saving new work order: \(error.localizedDescription)")
     } else {
     print("Work Order saved successfully")
     }
     }
     } catch {
     print("Error encoding Work Order")
     }
     }*/
    
    
    
    func deleteSquawk(at offsets: IndexSet) {
        squawks.remove(atOffsets: offsets)
    }
    
    
}
