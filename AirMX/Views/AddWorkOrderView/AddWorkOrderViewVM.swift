//
//  AddWorkOrderViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 5/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
final class AddWorkOrderViewVM {
    var aircraftHobbs = ""
    var aircraftCycles = ""
    var tailNumber = ""
    var workNotes = ""
    var parts = [Part]()
    
    var showAlert = false
    var showPartsSheet = false
    
    func uploadWorkOrder() async throws {
        guard canSave() else { return }
        //guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let workOrder = AircraftWorkOrder(hobbs: aircraftHobbs, cycles: aircraftCycles, tailNumber: tailNumber, datePerformed: Timestamp(), workNotes: workNotes, parts: parts)
        try await WorkOrderService.shared.uploadWorkOrder(workOrder)
    }
    
    
    
//    
//    func save() {
//        // MARK: - Not used
//        guard canSave() else {
//            return
//        }
//        
//        // Get user id
//        guard let uId = Auth.auth().currentUser?.uid else {
//            return
//        }
//        
//        //Create a model
//        let newId = UUID().uuidString
//        let newItem = AircraftWorkOrder(hobbs: aircraftHobbs, cycles: aircraftCycles, tailNumber: tailNumber, datePerformed: Timestamp(date: Date()), workNotes: workNotes, parts: parts)
//        
//        //Save model
//        do {
//            let db = Firestore.firestore()
//            try db.collection("users").document(uId).collection("workOrders").document(newId).setData(from: newItem){ error in
//                if let error {
//                    print("Error saving new work order: \(error.localizedDescription)")
//                } else {
//                    print("Work Order saved successfully")
//                }
//            }
//        } catch {
//            print("Error encoding Work Order")
//        }
//    }
    
    
    func canSave() -> Bool {
        guard !tailNumber.trimmingCharacters(in: .whitespaces).isEmpty, !aircraftHobbs.isEmpty, !aircraftCycles.isEmpty else {
            return false
        }
        return true
    }
    
    
    
    
}
