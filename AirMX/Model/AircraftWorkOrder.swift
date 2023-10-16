//
//  AircraftWorkOrder.swift
//  AirMX
//
//  Created by Mark Trance on 5/3/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

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
    @DocumentID var workOrderId: String?
    
    var hobbs: String
    var cycles: String
    var tailNumber: String
    var datePerformed: Timestamp
    var workNotes: String
    var parts: [Part]?
    
    var id: String {
        return workOrderId ?? UUID().uuidString
    }
}

