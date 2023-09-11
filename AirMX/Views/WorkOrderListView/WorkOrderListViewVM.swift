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
final class WorkOrderListViewVM {
    var showingNewItemView = false
    var sortMethod = 0
    
    var selectedSort: SortOptions = .date

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

enum SortOptions: String, CaseIterable, Identifiable {
    case date = "Date"
    case tailNumber = "Tail Number"
    
    var id: String { self.rawValue }
}




// old init method putting here incase something breaks
/*
 init(userId: String) {
 // users/<id>/workOrders/<entries>
 self._orders = FirestoreQuery(collectionPath: "users/\(userId)/workOrders", predicates: [.order(by:"datePerformed", descending: true)])
 //self._viewModel = StateObject(wrappedValue: WorkOrderListViewVM(userId: userId))
 }
 */
