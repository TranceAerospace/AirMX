//
//  Helper.swift
//  PerformedX
//
//  Created by Mark Trance on 2/25/23.
//

import Foundation

struct Helper {
    static func convert(toString fromDate: Date?) -> String {
        guard let fromDate else {
            return "No date provided"
        }
        
            // Desired format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: fromDate)
    }
}



