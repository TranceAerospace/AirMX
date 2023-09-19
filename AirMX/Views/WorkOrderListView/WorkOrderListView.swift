//
//  EmptyView1.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import SwiftUI
import FirebaseFirestoreSwift
// TODO: - Design a custom row
struct WorkOrderListView: View {
    
    @Bindable var viewModel: WorkOrderListViewVM
    @FirestoreQuery var orders: [AircraftWorkOrder]
    
    
    var groupedOrders: [String: [AircraftWorkOrder]] {
        Dictionary(grouping: orders) { order in
            Helper.convert(toString: order.datePerformed.dateValue())
        }
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.airMXBackground
                    .ignoresSafeArea()
                VStack {
                    if groupedOrders.isEmpty {
                        EmptyListView()
                    } else {
                        
                        Picker("", selection: $viewModel.selectedSort) {
                            ForEach(SortOptions.allCases, id: \.self) { option in
                                Text(option.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        
                        if viewModel.selectedSort.rawValue == "Date" {
                            displayListByDate()
                                .shadow(radius: 2, x: 2, y: 2)
                                .scrollContentBackground(.hidden)
                        } else if viewModel.selectedSort.rawValue == "Tail Number" {
                            displayListByTailNumber()
                                .shadow(radius: 2, x: 2, y: 2)
                                .scrollContentBackground(.hidden)
                        }
                    }
                }
                
                .navigationTitle("Aircraft Work Orders")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "doc.badge.plus")
                            .font(.title2)
                            .symbolEffect(.variableColor)
                            .foregroundStyle(Color(.airMXGreen))
                    }
                }
                .fullScreenCover(isPresented: $viewModel.showingNewItemView) {
                    AddWorkOrderView()
                }
                
                //.background(Color(.airMXBackground).ignoresSafeArea())
            .tint(Color(.airMXBlack))
            }
        }
        
    }
    
#warning("Fix/combine these.")
    private func displayListByDate() -> some View {
        List {
            ForEach(groupedOrders.sorted(by: { $0.key > $1.key }), id: \.key) { key, value in
                Section(header: Text(key)) {
                    ForEach(value, id: \.self) { order in
                        NavigationLink(destination: WorkOrderDetailView(vm: WorkOrderDetailVM(workOrder: order))) {
                            WorkOrderRowView(workOrder: order)
                        }
                        .listRowSeparatorTint(Color(.airMXDarkGreen))
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: order.id)
                            }
                            .tint(.red)
                        }
                    }
                }
            }
        }
    }
    
    
    private func displayListByTailNumber() -> some View {
        // Group orders by tailNumber
        let groupedByTailNumber = Dictionary(grouping: orders, by: {$0.tailNumber})
        
        // Sort the keys (tail numbers) alphabetically
        let sortedKeys = groupedByTailNumber.keys.sorted()
        
        return List {
            ForEach(sortedKeys, id: \.self) { tailNumber in
                if let ordersForTailNumber = groupedByTailNumber[tailNumber] {
                    Section(header: Text(tailNumber)) {
                        ForEach(ordersForTailNumber, id: \.self) { order in
                            NavigationLink(destination: WorkOrderDetailView(vm: WorkOrderDetailVM(workOrder: order))) {
                                WorkOrderRowView(workOrder: order)
                            }
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: order.id)
                                }
                                .tint(.red)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}

#Preview {
    WorkOrderListView(viewModel: WorkOrderListViewVM(userId: "LEaWBY82ciPnFDkxaAo5fKFfCpA2"), orders: FirestoreQuery(collectionPath: "users/LEaWBY82ciPnFDkxaAo5fKFfCpA2/workOrders", predicates: [.order(by:"datePerformed", descending: true)]))
    
}
