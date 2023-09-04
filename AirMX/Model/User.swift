//
//  User.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import Foundation
import FirebaseFirestore

struct User: Codable {
    let id: String
    var name: String
    var emailAddress: String
    var organization: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case name = "displayName"
        case emailAddress = "email"
        case organization
    }
    
    
}
