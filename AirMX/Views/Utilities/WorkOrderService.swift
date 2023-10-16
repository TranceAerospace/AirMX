//
//  WorkOrderService.swift
//  AirMX
//
//  Created by Mark Trance on 10/14/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine

@Observable
final class WorkOrderService {
    
    private var workOrderListener: ListenerRegistration? = nil
    static let shared = WorkOrderService()
    
    func uploadWorkOrder(_ workOrder: AircraftWorkOrder) async throws {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        guard let orderData = try? Firestore.Encoder().encode(workOrder) else { return }
        try await Firestore.firestore().collection("users/\(userId)/workOrders").addDocument(data: orderData)
    }

    func removeListenerForWorkOrders() {
        self.workOrderListener?.remove()
    }
    
    func addListenerForWorkOrders() -> AnyPublisher<[AircraftWorkOrder], Error> {
        let publisher = PassthroughSubject<[AircraftWorkOrder], Error>()
        
        guard let userId = Auth.auth().currentUser?.uid else { return publisher.eraseToAnyPublisher() }
        self.workOrderListener = Firestore.firestore().collection("users/\(userId)/workOrders").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else { return }
            
            let workOrders = documents.compactMap { try? $0.data(as: AircraftWorkOrder.self) }
            publisher.send(workOrders)
        }
        return publisher.eraseToAnyPublisher()
    }
    
  
    
    
    //    static func fetchUserThreads(uid: String) async throws -> [Thread] {
    //        let snapshot = try await Firestore
    //            .firestore()
    //            .collection("threads")
    //            .whereField("ownerUid", isEqualTo: uid)
    //            .getDocuments()
    //
    //        let threads = snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
    //
    //        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    //    }
}

