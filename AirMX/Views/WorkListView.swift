////
////  WorkListView.swift
////  AirMX
////
////  Created by Mark Trance on 2/24/23.
////
//
//import SwiftUI
//
//// TODO: - This view may need its own viewModel
//struct WorkListView: View {
//    
//    @EnvironmentObject private var workOrderStore: WorkOrderStore
//    @State private var showingAddScreen = false
//    @State private var sortOption: WorkOrderStore.sortOption = .date
//    
//    var sortedOrders: [AircraftWorkOrder] {
//        switch sortOption {
//            case .date:
//                return workOrderStore.orders.sorted { $0.datePerformed < $1.datePerformed }
//            case .tailNumber:
//                return workOrderStore.orders.sorted { $0.tailNumber < $1.tailNumber }
//        }
//    }
//    
//    
//    
//    var body: some View {
//        NavigationStack {
//            //            if workOrderStore.orders.isEmpty {
//            //
//            //                EmptyListView()
//            //                    .padding(.top, 75)
//            //            }
//            
//            VStack {
//                // TODO: - Fix sorting
//                Picker("Sort By", selection: $sortOption) {
//                    Text("Date").tag(WorkOrderStore.sortOption.date)
//                    Text("Tail Number").tag(WorkOrderStore.sortOption.tailNumber)
//                }
//                .pickerStyle(.segmented)
//                .padding(.horizontal)
//                .padding(.vertical, 6)
//                
//                List {
//                    ForEach(workOrderStore.sortedDates, id: \.self) { itemKey in
//                        
//                        Section(header: Text(itemKey) ) {
//                            ForEach(workOrderStore.dates[itemKey]!) { order in
//                                
//                                NavigationLink(value: order) {
//                                    
//                                    VStack(alignment: .leading) {
//                                        Text(order.tailNumber )
//                                            .font(.headline)
//                                        Text(order.hobbs )
//                                            .foregroundColor(.secondary)
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                .navigationDestination(for: AircraftWorkOrder.self) { order in
//                    WorkOrderDetailView(workOrder: order)
//                }
//                .listStyle(.sidebar)
//                .navigationTitle("Aircraft Work Orders")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            showingAddScreen.toggle()
//                        } label: {
//                            Label("Add Order", systemImage: "plus")
//                                .foregroundColor(.green)
//                        }
//                    }
//                    //                    ToolbarItem(placement: .navigationBarLeading) {
//                    //                        if !workOrderStore.orders.isEmpty {
//                    //                            EditButton()
//                    //                        }
//                    //                    }
//                }
//            }
//            
//        }
//        .sheet(isPresented: $showingAddScreen) {
//            AddWorkOrderView()
//        }
//    }
//}
//
//struct WorkListView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkListView()
//            .environmentObject(WorkOrderStore())
//    }
//}
