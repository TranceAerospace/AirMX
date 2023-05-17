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
    
    @StateObject var viewModel: WorkOrderListViewVM
    @FirestoreQuery var orders: [AircraftWorkOrder]
    
    
    init(userId: String) {
        // users/<id>/workOrders/<entries>
        self._orders = FirestoreQuery(collectionPath: "users/\(userId)/workOrders")
        self._viewModel = StateObject(wrappedValue: WorkOrderListViewVM(userId: userId))
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if !orders.isEmpty {
                    List(orders, id: \.self) { order in
                        NavigationLink(value: order) {
                            // TODO
                            Text(order.tailNumber)
                        }
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: order.id)
                                }
                                .tint(.red)
                            }
                    }
                    .navigationDestination(for: AircraftWorkOrder.self) { order in
                        WorkOrderDetailView(workOrder: order)
                    }
                .listStyle(.plain)
                }
                else {
                    EmptyListView()
                }
            }
            .navigationTitle("Aircraft Work Orders")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                AddWorkOrderView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct WorkOrderListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOrderListView(userId: "fJa8Am01iwMdip38DBGHrAtat7H3")
    }
}
