//
//  DataController.swift
//  AirMX
//
//  Created by Mark Trance on 2/24/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    let container: NSPersistentContainer
    
    init() {
        
        container = NSPersistentContainer(name: "WorkOrder")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
}
