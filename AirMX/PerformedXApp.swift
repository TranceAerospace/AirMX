//
//  PerformedXApp.swift
//  PerformedX
//
//  Created by Mark Trance on 2/24/23.
//

import SwiftUI

@main
struct PerformedXApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            WorkListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
