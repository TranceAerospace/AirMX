//
//  AirMXApp.swift
//  AirMX
//
//  Created by Mark Trance on 2/24/23.
//

import SwiftUI

@main
struct AirMX: App {
    
    var body: some Scene {
        WindowGroup {
            WorkListView()
                .environment(\.managedObjectContext, DataController.shared.container.viewContext)
        }
    }
}
