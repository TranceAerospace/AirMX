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
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.airMXBackground
                    .ignoresSafeArea()
                VStack {
                    if orders.isEmpty {
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
                            displayList(sortOption: .date)
                                .shadow(radius: 2, x: 2, y: 2)
                                .scrollContentBackground(.hidden)
                        } else if viewModel.selectedSort.rawValue == "Tail Number" {
                            displayList(sortOption: .tailNumber)
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
    
    
    private func displayList(sortOption: SortOptions) -> some View {
        let groupedData: [String: [AircraftWorkOrder]]
        var sortedKeys: [String]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        switch sortOption {
            case .date:
                groupedData = Dictionary(grouping: orders) { order in
                    return dateFormatter.string(from: order.datePerformed.dateValue())
                }
                
            case .tailNumber:
                groupedData = Dictionary(grouping: orders, by: { $0.tailNumber })
        }
        
        sortedKeys = sortOption == .date ? groupedData.keys.sorted(by: >) : groupedData.keys.sorted()
        
        return List {
            ForEach(sortedKeys, id: \.self) { key in
                if let ordersForKey = groupedData[key] {
                    Section(header: Text(key)) {
                        ForEach(ordersForKey, id: \.self) { order in
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
