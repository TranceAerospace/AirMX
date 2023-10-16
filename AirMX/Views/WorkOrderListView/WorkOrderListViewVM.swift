//
//  EmptyView1VM.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

/// ViewModel for list of items view
/// Primary Tab
@Observable
final class WorkOrderListViewVM {
    var showingNewItemView = false
    var sortMethod = 0
    
    var selectedSort: SortOptions = .date
    var workOrders = [AircraftWorkOrder]()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        //Task { try await fetchWorkOrders() }
    }
    
//    @MainActor
//    func fetchWorkOrders() async throws {
//        print("fetching work orders in vm")
//        self.workOrders = try await WorkOrderService.fetchWorkOrders()
//        //try await fetchUserDataForThreads()
//    }
    
    @MainActor
    func addListenerForWorkOrders() {
        WorkOrderService.shared.addListenerForWorkOrders()
            .sink { completion in
                
            } receiveValue: { [weak self] workOrders in
                self?.workOrders = workOrders
            }
            .store(in: &cancellables)
    }
    
//    private func fetchUserDataForThreads() async throws {
//        for i in 0 ..< threads.count {
//            let thread = threads[i]
//            let ownerUid = thread.ownerUid
//            
//            let threadUser =  try await UserService.fetchUser(withUid: ownerUid)
//            
//            threads[i].user = threadUser
//        }
//    }
    
    //private let userId: String
    
    
//    init(userId: String) {
//        self.userId = userId
//    }
    
    
    /// Delete list item
    /// - Parameter id: Item id to delete
//    func delete(id: String) {
//        let db = Firestore.firestore()
//        
//        db.collection("users")
//            .document(userId)
//            .collection("workOrders")
//            .document(id)
//            .delete()
//    }
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
