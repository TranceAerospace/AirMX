//
//  WorkOrderDetailView.swift
//  AirMX
//
//  Created by Mark Trance on 2/25/23.
//

import SwiftUI
import FirebaseFirestore

struct WorkOrderDetailView: View {
    @Bindable var vm: WorkOrderDetailVM
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            Text(Helper.convert(toString: vm.workOrder.datePerformed.dateValue()))
            VStack(alignment: .leading, spacing: 4) {
                Text("Aircraft Hobbs: \(vm.workOrder.hobbs)")
                Text("Aircraft Cycles: \(vm.workOrder.cycles)")
                Text("Notes: \(vm.workOrder.workNotes)")
            }
            .padding(.vertical, 8)
            
        }
        .navigationTitle(vm.workOrder.tailNumber)
        .alert("Delete Work Order", isPresented: $vm.showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteWorkOrder)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure? This action cannot be undone!")
            
        }
        .toolbar {
            Button {
                vm.showingDeleteAlert = true
            } label: {
                Label("Delete book", systemImage: "trash")
                    .foregroundColor(.red)
            }
        }
    }
    
    //TODO: - Not implemented
    func deleteWorkOrder() {
        
        dismiss()
    }
    
    
    
}

#Preview {
    NavigationStack {
        WorkOrderDetailView(vm: WorkOrderDetailVM(workOrder: AircraftWorkOrder(id: "", hobbs: "1999", cycles: "2999", tailNumber: "N1211A", datePerformed: Timestamp(date: Date()), workNotes: "No notes", parts: nil)))
    }
}



