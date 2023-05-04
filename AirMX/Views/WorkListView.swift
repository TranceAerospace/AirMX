    //
    //  WorkListView.swift
    //  AirMX
    //
    //  Created by Mark Trance on 2/24/23.
    //

import SwiftUI

struct WorkListView: View {
    
    
    @State private var showingAddScreen = false
    @State private var listOfWords = Array.init(repeating: "words", count: 5)
    
    var body: some View {
        NavigationStack {
            if listOfWords.isEmpty {

                EmptyListView()
                    .padding(.top, 75)
            }
            
            List($listOfWords, id: \.self, editActions: .delete) { $item in
                Text(item)
//                Section(header: Text(section.id ?? "No date Added")) {
//                    ForEach(section) { order in
//                        NavigationLink {
//                            WorkOrderDetailView(workOrder: order)
//                        } label: {
//
//                            VStack(alignment: .leading) {
//                                Text(order.tailNumber ?? "No Tail Number")
//                                    .font(.headline)
//                                Text(order.hobbs ?? "No hobbs listed")
//                                    .foregroundColor(.secondary)
//                            }
//                        }
//                    }
//                }
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
                    if !listOfWords.isEmpty {
                        EditButton()
                    }
                }
            }
            
        }
        .sheet(isPresented: $showingAddScreen) {
            AddWorkOrderView()
        }
    }
}

struct WorkListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkListView()
    }
}
