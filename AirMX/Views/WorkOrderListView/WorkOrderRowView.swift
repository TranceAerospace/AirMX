//
//  WorkOrderRowView.swift
//  AirMX
//
//  Created by Mark Trance on 5/17/23.
//

import SwiftUI
import FirebaseFirestore

struct WorkOrderRowView: View {
    
    let workOrder: AircraftWorkOrder
    
    var body: some View {
        HStack(spacing: 25) {
            Text(workOrder.tailNumber)
                .font(.caption)
                .frame(width: 60, height: 40)
                .background(.bar)
                .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10), style: .continuous))
                .shadow(radius: 2, x: 2, y: 2)
            
            VStack {
                Text(workOrder.datePerformed.dateValue().formatted(date: .numeric, time: .omitted))
                    .bold()
                Text(workOrder.workNotes)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
        }
    }
}

//#Preview {
//    WorkOrderRowView(workOrder: AircraftWorkOrder(id: "", hobbs: "1999", cycles: "2999", tailNumber: "N1211A", datePerformed: Timestamp(date: Date()), workNotes: "No notes", parts: nil))
//        .previewLayout(.fixed(width: 300, height: 100))
//}
