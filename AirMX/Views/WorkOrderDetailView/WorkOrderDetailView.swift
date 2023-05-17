//
//  WorkOrderDetailView.swift
//  AirMX
//
//  Created by Mark Trance on 2/25/23.
//

import SwiftUI
import CoreData

struct WorkOrderDetailView: View {
    
    let workOrder: AircraftWorkOrder
    
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    
    func deleteWorkOrder() {
        
        dismiss()
    }
    
    var body: some View {
        ScrollView {
            //Text(workOrder.datePerformed)
            VStack(alignment: .leading, spacing: 4) {
                Text("Aircraft Hobbs: \(workOrder.hobbs)")
                Text("Aircraft Cycles: \(workOrder.cycles)")
                Text("Notes: \(workOrder.workNotes)")
            }
            .padding(.vertical, 8)
            
            

        }
        .navigationTitle(workOrder.tailNumber)
        .alert("Delete Work Order", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteWorkOrder)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure? This action cannot be undone!")
            
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete book", systemImage: "trash")
                    .foregroundColor(.red)
            }
        }
    }
}





struct WorkOrderDetailView_Previews: PreviewProvider {
    //let order = WorkOrderStore()
    static var previews: some View {
        NavigationStack {
            WorkOrderDetailView(workOrder: AircraftWorkOrder(id: "", hobbs: "1999", cycles: "2999", tailNumber: "N1211A", datePerformed: Date().timeIntervalSince1970, workNotes: "No notes"))
        }
        
        
    }
}



