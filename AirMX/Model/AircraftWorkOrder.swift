//
//  AircraftWorkOrder.swift
//  AirMX
//
//  Created by Mark Trance on 5/3/23.
//

import Foundation

struct AircraftWorkOrder: Identifiable, Codable, Hashable {
    let id: String
    let hobbs: String
    let cycles: String
    let tailNumber: String
    let datePerformed: TimeInterval
    let workNotes: String
    //let parts: [Part]?
}
