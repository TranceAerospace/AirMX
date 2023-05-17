////
////  WorkOrderStore.swift
////  AirMX
////
////  Created by Mark Trance on 5/3/23.
////
//
//import SwiftUI
//
//
//@MainActor class WorkOrderStore: ObservableObject {
//    @Published private(set) var workOrder = AircraftWorkOrders()
//    
//    var orders: [AircraftWorkOrder] {
//        return workOrder.orders
//    }
//    
////    var dates: [String: [AircraftWorkOrder]] {
////         Dictionary(grouping: orders, by: { $0.datePerformed } )
////    }
////    
////    var sortedDates: [String] {
////        dates.keys.sorted()
////    }
//    
//    var tailNumbers: [String: [AircraftWorkOrder]] {
//        Dictionary(grouping: orders, by: { $0.tailNumber } )
//    }
//    
//    var sortedTailNumber: [String] {
//        tailNumbers.keys.sorted()
//    }
//    
//    
//    func addOrder(_ order: AircraftWorkOrder) {
//        workOrder.addWorkOrder(order)
//    }
//    
//    enum sortOption {
//        case date, tailNumber
//    }
//    
//    init() {
////        let exampleOrders = buildExample()
////        for order in exampleOrders {
////            addOrder(order)
////        }
//    }
//    
////    private func buildExample() -> [AircraftWorkOrder] {
////        let workOrders = [
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N212AA", datePerformed: "11/7/2999", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N213AA", datePerformed: "11/7/2000", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N2145AA", datePerformed: "11/7/2012", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N215AA", datePerformed: "11/7/2342", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N213AA", datePerformed: "11/7/2005", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N216AA", datePerformed: "11/7/2005", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N217AA", datePerformed: "11/7/2002", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N218AA", datePerformed: "11/7/2002", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N219AA", datePerformed: "11/7/2002", workNotes: "Stuff was changed"),
////            AircraftWorkOrder(hobbs: "1958.8", cycles: "1999", tailNumber: "N219AA", datePerformed: "11/7/2002", workNotes: "Stuff was changed"),
////
////
////        ]
////        return workOrders
////    }
//    
//    
//}
//    
//    
