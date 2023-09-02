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
    let name: String
    let emailAddress: String
    //let joined: Timestamp
    
    enum CodingKeys: String, CodingKey {
        case id = "uid"
        case name = "display_name"
        case emailAddress = "email"
        //case joined
    }
    
    
}
