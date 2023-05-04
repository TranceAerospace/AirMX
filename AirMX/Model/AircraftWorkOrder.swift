//
//  AircraftWorkOrder.swift
//  AirMX
//
//  Created by Mark Trance on 5/3/23.
//

import Foundation

struct AircraftWorkOrderr {
    let id = UUID()
    let hobbs: String
    let cycles: String
    let tailNumber: String
    let datePerformed: String
    let workNotes: String
    let parts: [Part]
    
}
