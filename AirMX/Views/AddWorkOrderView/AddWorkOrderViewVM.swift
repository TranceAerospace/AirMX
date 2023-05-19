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
    
    @Published var showAlert = false
    
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
        let newItem = AircraftWorkOrder(id: newId, hobbs: aircraftHobbs, cycles: aircraftCycles, tailNumber: tailNumber, datePerformed: Timestamp(date: Date()), workNotes: workNotes)
        
        //Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("workOrders")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
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
