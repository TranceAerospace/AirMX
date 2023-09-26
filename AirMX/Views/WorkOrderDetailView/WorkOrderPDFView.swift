//
//  WorkOrderPDFView.swift
//  AirMX
//
//  Created by Mark Trance on 9/23/23.
//

import SwiftUI
import FirebaseFirestore

struct WorkOrderPDFView: View {
    @State var workOrder: AircraftWorkOrder
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(workOrder.datePerformed.dateValue().formatted(date: .numeric, time: .omitted))
                    .font(.title2)
                    .padding(.horizontal)
            }
            
            Text(workOrder.tailNumber)
                .bold()
                .font(.title)
        }
        
        Section {
            VStack(alignment: .leading) {
                HStack {
                    Text("Aircraft Hours:")
                    Text(workOrder.hobbs)
                    Spacer()
                }
                HStack {
                    Text("Aircraft Cycles:")
                    Text(workOrder.cycles)
                }
                HStack(alignment: .top) {
                    Text("Work Notes:")
                    Text(workOrder.workNotes)
                }
            }
            .padding()
        } header: {
            Text("Aircraft Info")
                .font(.title2)
                .underline()
        }
        
        Section {
            if workOrder.parts?.isEmpty == false {
                ForEach(workOrder.parts!) { part in
                    PartsDetailView(part: part)
                }
                .padding(.vertical, 8)
            } else {
                Text("No Parts Changed")
                    .padding(.vertical, 8)
            }
        } header: {
            Text("Parts Changed")
                .font(.title3)
                .bold()
                .underline()
        }
        
        Spacer()
    }
}

#Preview {
    WorkOrderPDFView(workOrder: AircraftWorkOrder(id: "", hobbs: "1999", cycles: "2999", tailNumber: "N1211A", datePerformed: Timestamp(date: Date()), workNotes: "Remove and replace R/H Landing Gear Actuator.", parts: [Part(id: "1", partNumberOff: "13123", serialNumberOff: "5664", partNumberOn: "1233123", serialNumberOn: "45646"), Part(id: "2", partNumberOff: "13124", serialNumberOff: "5664", partNumberOn: "1233123", serialNumberOn: "45646")]))
}
