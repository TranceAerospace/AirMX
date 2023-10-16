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
    
    @State private var renderedView: URL?
    
    var body: some View {
        
        ZStack {
            Color(.airMXBackground)
                .ignoresSafeArea()
            
            ScrollView {
                
                HStack {
                    Text("Date Performed:")
                    Text(vm.workOrder.datePerformed.dateValue().formatted(date: .numeric, time: .omitted))
                }
                .foregroundStyle(.secondary)
                .font(.title3)
                .bold()
                
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Aircraft Hobbs:")
                            
                            TextField("Aircraft Hobbs", text: $vm.workOrder.hobbs)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .border(Color.airMXGreen.opacity(0.2), width: 2)
                                
                            
                        }
                        
                        HStack {
                            Text("Aircraft Cycles:")
                            TextField("Aircraft Cycles:", text: $vm.workOrder.cycles)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.decimalPad)
                                .border(Color.airMXGreen.opacity(0.2), width: 2)
                               
                        }
                        
                        Spacer(minLength: 10)
                        Text("Work Notes:")
                            .underline()
                        TextField("Work Performed", text: $vm.workOrder.workNotes, axis: .vertical)
                            .lineLimit(4)
                            .textFieldStyle(.roundedBorder)
                            .border(Color.airMXGreen.opacity(0.2), width: 2)
                            .autocorrectionDisabled()
                        
                        
                        Spacer(minLength: 10)
                        
                        
                    }
                    .padding(.horizontal)
                    
                } header: {
                    Text("Aircraft Info")
                        .font(.title3)
                        .bold()
                        .underline()
                        .padding(.top, 10)
                }
                
                Section {
                    if !vm.parts.isEmpty {
                        ForEach(vm.parts) { part in
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
            }
            .onAppear {
                renderedView = vm.render(importedView: WorkOrderPDFView(workOrder: vm.workOrder))
            }
            .navigationTitle(vm.workOrder.tailNumber)
            .alert("Delete Work Order", isPresented: $vm.showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deleteWorkOrder)
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Are you sure? This action cannot be undone!")
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if let renderedView {
                        ShareLink(item: (renderedView)) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(Color.airMXGreen)
                                .font(.title3)
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        vm.showingDeleteAlert = true
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(Color.airMXRed)
                            .font(.title3)
                    }
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        hideKeyboard()
                    } label: {
                        Text("Done")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
    
    //"Deleting from detail screen Not implemented"
    func deleteWorkOrder() {
        dismiss()
    }
    
    
}

//#Preview {
//    NavigationStack {
//        WorkOrderDetailView(vm: WorkOrderDetailVM(workOrder: AircraftWorkOrder(id: "", hobbs: "1999", cycles: "2999", tailNumber: "N1211A", datePerformed: Timestamp(date: Date()), workNotes: "asddldjkfs;lkfjsa;flkjas;lfkjs;fkjs;lfjks;dklfjas;lkdjfsa;lkjfas;lkjdflskjfdkfjhrvnni492834u984uoairlaksjdfl;akjsfd;lksdajf\n29842304823p04982oliduja;lksjdff", parts: [Part(id: "1", partNumberOff: "13123", serialNumberOff: "5664", partNumberOn: "1233123", serialNumberOn: "45646"), Part(id: "2", partNumberOff: "13124", serialNumberOff: "5664", partNumberOn: "1233123", serialNumberOn: "45646")])))
//    }
//}



