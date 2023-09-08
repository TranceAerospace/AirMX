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
        
        ZStack {
            Color(.airMXBackground)
                .ignoresSafeArea()
            
            ScrollView {
                Text(Helper.convert(toString: vm.workOrder.datePerformed.dateValue()))
                    .font(.title2)
                    .bold()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Aircraft Hobbs: \(vm.workOrder.hobbs)")
                    Text("Aircraft Cycles: \(vm.workOrder.cycles)")
                    Text("Notes: \(vm.workOrder.workNotes)")
                    
                    
                }
                .padding(.vertical, 8)
                
#warning("Extract this view")
                Section {
                    ForEach(vm.parts) { part in
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Part Removed: ")
                                Text(part.partNumberOff)
                            }
                            HStack {
                                Text("Part Installed: ")
                                Text(part.partNumberOn)
                            }
                            HStack {
                                Text("S/N Removed: ")
                                Text(part.serialNumberOff)
                            }
                            HStack {
                                Text("S/N Installed: ")
                                Text(part.serialNumberOn)
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    
                } header: {
                    Text("Parts Changed")
                        .font(.title2)
                        .bold()
                        .underline()
                }
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
                    Image(systemName: "trash")
                        .foregroundStyle(Color.airMXRed)
                        .font(.title2)
                }
            }
        }
    }
    
#warning("Deleting from detail screen Not implemented")
    func deleteWorkOrder() {
        
        dismiss()
    }
    
    
    
}

#Preview {
    NavigationStack {
        WorkOrderDetailView(vm: WorkOrderDetailVM(workOrder: AircraftWorkOrder(id: "", hobbs: "1999", cycles: "2999", tailNumber: "N1211A", datePerformed: Timestamp(date: Date()), workNotes: "No notes", parts: [Part(id: "1", partNumberOff: "13123", serialNumberOff: "5664", partNumberOn: "1233123", serialNumberOn: "45646"), Part(id: "2", partNumberOff: "13124", serialNumberOff: "5664", partNumberOn: "1233123", serialNumberOn: "45646")])))
    }
}



