//
//  EmptyView1VM.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary Tab
class WorkOrderListViewVM: ObservableObject {
    @Published var showingNewItemView = false
    @Published var sortMethod = 0
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    /// Delete list item
    /// - Parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("workOrders")
            .document(id)
            .delete()
    }
}
