//
//  SquawkView.swift
//  AirMX
//
//  Created by Mark Trance on 9/3/23.
//

import SwiftUI
#warning("Split to a view model")
struct SquawkView: View {
    @State var squawks = SquawkModel.squawkExamples.map { $0 }
    @State private var showingAddWorkOrder: Bool = false
    @State private var selectedSquawkTailNumber: String?
    @State private var showNewSquawkView = false
    
    var body: some View {
        NavigationStack {
            
            List($squawks) { $squawk in
                SquawkRowView(squawkModel: $squawk)
                    .listRowSeparatorTint(.airMXDarkGreen)
                
                    .swipeActions {
                        Button($squawk.completed.wrappedValue ? "Broke" : "Completed") {
                            $squawk.completed.wrappedValue.toggle()
                            if squawk.completed == true {
                                showingAddWorkOrder = true
                                selectedSquawkTailNumber = squawk.tailNumber
                            }
                        }
                        .tint($squawk.completed.wrappedValue ? .airMXRed : .airMXGreen)
                    }
                    .alert("Start a New Work Order", isPresented: $showingAddWorkOrder) {
                        Button("GO", action: showWorkOrder)
                        Button("Cancel", role: .cancel) {
                            showingAddWorkOrder = false
                        }
                    } message: {
                        if let selectedSquawkTailNumber {
                            Text("Would you like to start a new work order for \(selectedSquawkTailNumber) if you haven't already?")
                        } else {
                            Text("Would you like to start a new work order?")
                        }
                    }
            }
            .shadow(radius: 2, x: 2, y: 2)
            .scrollContentBackground(.hidden)
            
            .background(Color(.airMXBackground).ignoresSafeArea())
            .navigationTitle("Squawk List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewSquawkView = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                            .symbolEffect(.variableColor)
                            .foregroundStyle(.airMXGreen)
                    }
                    .fullScreenCover(isPresented: $showNewSquawkView) {
                        AddSquawkView()
                    }
                }
            }
        }
    }
    func showWorkOrder() {
        print("Add work order presented")
        showingAddWorkOrder = false
    }
    
    func addSquawk() {
        squawks.append(SquawkModel(tailNumber: "N893WB", squawkText: "Stuff's Broken", dateText: "9/1/2010"))
    }
}

#Preview {
    SquawkView()
}
