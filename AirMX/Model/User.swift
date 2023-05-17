//
//  User.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let emailAddress: String
    let joined: TimeInterval
}
