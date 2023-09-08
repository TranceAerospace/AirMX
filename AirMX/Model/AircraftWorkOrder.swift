//
//  AircraftWorkOrder.swift
//  AirMX
//
//  Created by Mark Trance on 5/3/23.
//

import Foundation
import FirebaseFirestore

/// An aircraft work order is a record of work performed on an aircraft.
///
/// An aircraft work order has a unique identifier, a hobbs reading, a cycles reading, a tail number, a date performed, work notes, and an array of parts that could have been removed and installed.
///
/// - Parameters:
///    - id: A unique identifier for the work order.
///    - hobbs: The hobbs reading of the aircraft at the time of the work order.
///    - cycles: The cycles reading of the aircraft at the time of the work order.
///    - tailNumber: The tail number of the aircraft.
///    - datePerformed: The date the work order was created.
///    - workNotes: Any notes about the work performed.
///    - parts: An array of parts that could have been removed and installed.

struct AircraftWorkOrder: Identifiable, Codable, Hashable {
    var id: String
    var hobbs: String
    var cycles: String
    var tailNumber: String
    var datePerformed: Timestamp
    var workNotes: String
    var parts: [Part]?
}

//MARK: - Future implementation of Aircraft work order store

/*
@Observable
final class AircraftWorkOrderRepository {
    var aircraftWorkOrders: [AircraftWorkOrder]
    private var db = Firestore.firestore()
    
    init(aircraftWorkOrders: [AircraftWorkOrder] = []) {
        self.aircraftWorkOrders = aircraftWorkOrders
    }
    
    // Save a new AircraftWorkOrder
    func saveAircraftWorkOrder(_ workOrder: AircraftWorkOrder, withID: String, for uId: String) {
        
        do {
            try db.collection("users").document(uId).collection("workOrders").document(withID).setData(from: workOrder) { error in
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
    
    // Read a specific AircraftWorkOrder from Firestore
    func getAircraftWorkOrders(for uID: String) {
        db.collection("users/\(uID)/workOrders").getDocuments { snapshot, err in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                do {
                    for document in snapshot!.documents {
                        let aircraftWorkOrder = try document.data(as: AircraftWorkOrder.self)
                        self.aircraftWorkOrders.append(aircraftWorkOrder)
                    }
                } catch {
                    print("Error decoding Work Order: \(error.localizedDescription)")
                }
            }
            print("WORK ORDER COUNT IS: \(self.aircraftWorkOrders.count)")
        }
        
        //        { (document, error) in
        //            if let document = document, document.exists {
        //                do {
        //                    let aircraftWorkOrder = try document.data(as: AircraftWorkOrder.self)
        //                    completion(aircraftWorkOrder, nil)
        //                } catch {
        //                    completion(nil, error)
        //                }
        //            } else if let error = error {
        //                completion(nil, error)
        //            }
        //        }
    }
    
    
    
    // Update an existing AircraftWorkOrder in Firestore
    func updateAircraftWorkOrder(_ workOrder: AircraftWorkOrder) {
        let documentRef = db.collection("workOrders").document(workOrder.id)
        
        do {
            try documentRef.setData(from: workOrder, merge: true)
            
        } catch {
            print("Error updating work order: \(error.localizedDescription)")
        }
    }
    
    // Delete an existing AircraftWorkOrder from Firestore
    //    func deleteAircraftWorkOrder(completion: @escaping (Error?) -> Void) {
    //        db.collection("workOrders").document(workOrder.id).delete { error in
    //            completion(error)
    //        }
    //    }
    
    
}
 */

