//
//  AddWorkOrderViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddWorkOrderViewVM: ObservableObject {
    @Published var aircraftHobbs = ""
    @Published var aircraftCycles = ""
    @Published var tailNumber = ""
    @Published var datePerformed = Date()
    @Published var workNotes = ""
    //@Published var parts = [Part]()
    
    @Published var showAlert = false
    @Published var showPartsSheet = false
    
    init() {}
    
    func save() {
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
        let newItem = AircraftWorkOrder(id: newId, hobbs: aircraftHobbs, cycles: aircraftCycles, tailNumber: tailNumber, datePerformed: Timestamp(date: Date()), workNotes: workNotes, parts: nil)
        
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
    }
    
    // MARK: - Deprecated for the moment
    var canSave: Bool {
        guard !tailNumber.trimmingCharacters(in: .whitespaces).isEmpty, !aircraftHobbs.isEmpty, !aircraftCycles.isEmpty else {
            return false
        }
        
        //        guard dueDate >= Date().addingTimeInterval(-86400) else {
        //            return false
        //        }
        return true
    }
}
