//
//  SquawkViewVM.swift
//  AirMX
//
//  Created by Mark Trance on 9/9/23.
//

import Foundation

@Observable
final class SquawkViewVM {
    
    var squawks = SquawkModel.squawkExamples.map { $0 }
    var showingAddWorkOrder: Bool = false
    var selectedSquawkTailNumber: String?
    var showNewSquawkView = false
    var goToAddWorkOrder = false
    
    init() {}
   
    func showWorkOrder() {
        print("Add work order presented")
        showingAddWorkOrder = false
    }
    
    func addSquawk() {
        squawks.append(SquawkModel(tailNumber: "N893WB", squawkText: "Stuff's Broken", dateText: "9/1/2010"))
    }
    
   
}

//Future implementation of getting squawks from Firebase

/*
 func getSquawks() async throws {
 let db = Firestore.firestore()
 let dbRef = db.collection("squawks")
 do {
 let querySnapshot = try await dbRef.getDocuments()
 for document in querySnapshot.documents {
 let squawk = try document.data(as: Squawk.self)
 squawks.append(squawk!)
 }
 } catch {
 print(error.localizedDescription)
 }
 }
 */
