//
//  EmptyView1VM.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

/// ViewModel for list of items view
/// Primary Tab
@Observable
class WorkOrderListViewVM {
    var showingNewItemView = false
    var sortMethod = 0
    
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


// old init method putting here incase something breaks
/*
     init(userId: String) {
         // users/<id>/workOrders/<entries>
         self._orders = FirestoreQuery(collectionPath: "users/\(userId)/workOrders", predicates: [.order(by:"datePerformed", descending: true)])
         //self._viewModel = StateObject(wrappedValue: WorkOrderListViewVM(userId: userId))
     }
 */
