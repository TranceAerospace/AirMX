//
//  WorkOrderDetailViewModel.swift
//  AirMX
//
//  Created by Mark Trance on 8/27/23.
//

import Foundation
import Observation

@Observable
class WorkOrderDetailVM {
    var workOrder: AircraftWorkOrder
    var showingDeleteAlert = false
    
    init(workOrder: AircraftWorkOrder) {
        self.workOrder = workOrder
    }
    
}
