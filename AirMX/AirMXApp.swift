//
//  AirMXApp.swift
//  AirMX
//
//  Created by Mark Trance on 2/24/23.
//

import SwiftUI
import FirebaseCore

@main
struct AirMX: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                //.environmentObject(WorkOrderStore())
        }
    }
}
