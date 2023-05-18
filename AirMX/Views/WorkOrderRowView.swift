//
//  WorkOrderRowView.swift
//  AirMX
//
//  Created by Mark Trance on 5/17/23.
//

import SwiftUI

struct WorkOrderRowView: View {
    
    let workOrder: AircraftWorkOrder
    
    var body: some View {
        HStack(spacing: 25) {
            Text(workOrder.tailNumber)
                .font(.caption)
                .frame(width: 60, height: 40)
                .background(.bar)
                .clipShape(Capsule())
                .shadow(radius: 2, x: 5, y: 5)
            
            VStack {
                Text(Helper.getCurrentDate(from: workOrder.datePerformed))
                    .bold()
                Text(workOrder.workNotes)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct WorkOrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOrderRowView(workOrder: AircraftWorkOrder(id: "", hobbs: "1999", cycles: "2999", tailNumber: "N1211A", datePerformed: Date().timeIntervalSince1970, workNotes: "No notes"))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
