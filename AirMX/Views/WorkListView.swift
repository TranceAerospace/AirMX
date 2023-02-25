//
//  WorkListView.swift
//  PerformedX
//
//  Created by Mark Trance on 2/24/23.
//

import SwiftUI

struct WorkListView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.datePerformed)]) var workOrders: FetchedResults<AircraftWorkOrder>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(workOrders) { order in
                    NavigationLink {
                        WorkOrderDetailView(workOrder: order)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(order.tailNumber ?? "No order")
                                .font(.headline)
                            Text(Helper.convert(toString: order.datePerformed))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteWorkOrder)
            }
            .navigationTitle("Aircraft Work Orders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Order", systemImage: "plus")
                            .foregroundColor(.green)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            
        }
        .sheet(isPresented: $showingAddScreen) {
            AddWorkOrderView()
        }
    }
    
    func deleteWorkOrder(at offsets: IndexSet) {
        for offset in offsets {
            let workOrder = workOrders[offset]
            moc.delete(workOrder)
        }
        try? moc.save()
    }
}

struct WorkListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkListView()
    }
}
