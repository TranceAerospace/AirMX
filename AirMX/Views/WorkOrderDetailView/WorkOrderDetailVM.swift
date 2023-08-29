//
//  WorkOrderDetailViewModel.swift
//  AirMX
//
//  Created by Mark Trance on 8/27/23.
//

import Foundation
import Observation

@Observable
class WorkOrderDetailViewModel {
    var workOrder: AircraftWorkOrder
    
    init(workOrder: AircraftWorkOrder) {
        self.workOrder = workOrder
    }
    
}
