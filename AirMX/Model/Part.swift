//
//Part.swift
//AirMX
//
//Created by Mark Trance on 2/27/23.


import Foundation


/// A part is a component of an aircraft that can be removed and replaced.
///
/// A part has a unique identifier, a part number, and a serial number. These are used to identify the part that was removed and the part that was installed in aircraft work orders.
///
/// - Parameters:
///    - id: The unique identifier for the part.
///    - partNumberOff: The part number of the part that was removed.
///    - serialNumberOff: The serial number of the part that was removed.
///    - partNumberOn: The part number of the part that was installed.
///    - serialNumberOn: The serial number of the part that was installed.

struct Part: Codable, Hashable, Identifiable {
    
    let id: String
    let partNumberOff: String
    let serialNumberOff: String
    let partNumberOn: String
    let serialNumberOn: String
}

