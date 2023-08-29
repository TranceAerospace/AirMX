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
                Color(.airMXBackground)
                    .ignoresSafeArea(edges: [.top, .horizontal])
                
                VStack {
                    if groupedOrders.isEmpty {
                        EmptyListView()
                    } else {
                        
                        Picker("", selection: $viewModel.sortMethod) {
                            Text("Date").tag(0)
                            Text("Tail Number").tag(1)
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        
                        if viewModel.sortMethod == 0 {
                            displayListByDate()
                                .shadow(radius: 2, x: 2, y: 2)
                                .scrollContentBackground(.hidden)
                        } else {
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
                        Image(systemName: "plus")
                            .symbolEffect(.pulse)
                            .foregroundStyle(Color(.airMXGreen))
                    }
                    
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    AddWorkOrderView()
                }
            }
            //.toolbarBackground(.hidden, for: .tabBar)
            
            .tint(Color(.airMXBlack))
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
        let groupedByTailNumber = Dictionary(grouping: orders) { order in
            order.tailNumber
        }
        
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
    WorkOrderListView(viewModel: WorkOrderListViewVM(userId: "7T6crErX8rfapVLyKfc1l3a20UL2"), orders: FirestoreQuery(collectionPath: "users/7T6crErX8rfapVLyKfc1l3a20UL2/workOrders", predicates: [.order(by:"datePerformed", descending: true)]))

}
