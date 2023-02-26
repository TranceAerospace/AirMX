    //
    //  WorkListView.swift
    //  AirMX
    //
    //  Created by Mark Trance on 2/24/23.
    //

import SwiftUI

struct WorkListView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    // Old fetch request, leaving as a placeholder for now
    //@FetchRequest(sortDescriptors: [SortDescriptor(\.datePerformed)]) var workOrders: //FetchedResults<AircraftWorkOrder>
    
    @SectionedFetchRequest(sectionIdentifier: \.datePerformed, sortDescriptors: [SortDescriptor(\.datePerformed), SortDescriptor(\.tailNumber), SortDescriptor(\.hobbs)]) private var workOrder: SectionedFetchResults<String?, AircraftWorkOrder>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            if workOrder.isEmpty {
                
                EmptyListView()
                    .padding(.top, 75)
            }
            
            List(workOrder) { section in
                
                Section(header: Text(section.id!)) {
                    ForEach(section) { order in
                        NavigationLink {
                            WorkOrderDetailView(workOrder: order)
                        } label: {
                            
                            VStack(alignment: .leading) {
                                Text(order.tailNumber ?? "No Tail Number")
                                    .font(.headline)
                                Text(order.hobbs ?? "No hobbs listed")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        withAnimation {
                            deleteWorkOrder(at: indexSet, for: section)
                        }
                    }
                }
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
                    if !workOrder.isEmpty {
                        EditButton()
                    }
                }
            }
            
        }
        .sheet(isPresented: $showingAddScreen) {
            AddWorkOrderView()
        }
    }
    
    func deleteWorkOrder(at offsets: IndexSet, for section: SectionedFetchResults<String?, AircraftWorkOrder>.Element) {
        offsets.map { section[$0] }.forEach(moc.delete)
        
        do {
            try moc.save()
        } catch {
            fatalError("Unresolved error \(error.localizedDescription)")
        }
    }
}

struct WorkListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkListView()
    }
}
