//
//  Helper.swift
//  AirMX
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
    
    static func toArray(_ set: NSSet?) -> [Part] {
        guard let parts = set else { return [] }
        let partsArray = parts.allObjects as! [Part]
        return partsArray
    }
    
    static func getCurrentDate(from time: TimeInterval) -> String {
        let currentDate = Date(timeIntervalSinceReferenceDate: time)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: currentDate)
    }
   
}

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}


/* color palette
 button shadow - .shadow(radius: 2, x: 4, y: 4)
 form shadow - .shadow(radius: 5, x: 5, y: 5)
                .scrollContentBackground(.hidden)
 
 main view background - Color(red: 233/255, green: 216/255, blue: 166/255, opacity: 0.3)
 button color - Color(red: 0/255, green: 95/255, blue: 115/255)
 register orange - Color(red: 202/255, green: 103/255, blue: 2/255)
 login red - Color(red: 174/255, green: 32/255, blue: 18/255)
 foreground text color - .foregroundColor(Color(red: 10/255, green: 147/255, blue: 150/255))
 navstack color - Color(red: 0/255, green: 18/255, blue: 25/255)
 */



