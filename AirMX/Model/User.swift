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
    var email: String
    var organization: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case name = "displayName"
        case email = "email"
        case organization
    }
    
    
}
