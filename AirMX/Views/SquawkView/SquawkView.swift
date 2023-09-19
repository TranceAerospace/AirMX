//
//  SquawkView.swift
//  AirMX
//
//  Created by Mark Trance on 9/3/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct SquawkView: View {
    @Bindable var viewModel = SquawkViewVM()
    
    var body: some View {
        NavigationStack {
            
            List($viewModel.squawks) { $squawk in
                SquawkRowView(squawkModel: $squawk)
                    .listRowSeparatorTint(.airMXDarkGreen)
                
                    .swipeActions {
                        Button($squawk.completed.wrappedValue ? "Broke" : "Completed") {
                            $squawk.completed.wrappedValue.toggle()
                            if squawk.completed == true {
                                viewModel.showingAddWorkOrder = true
                                viewModel.selectedSquawkTailNumber = squawk.tailNumber
                            }
                        }
                        .tint($squawk.completed.wrappedValue ? .airMXRed : .airMXGreen)
                    }
                    .alert("Start a New Work Order", isPresented: $viewModel.showingAddWorkOrder) {
                        Button {
                            print("Go")
                            viewModel.goToAddWorkOrder = true
                            
                        } label: {
                            Text("GO")
                        }
                        
                        Button("Cancel", role: .cancel) {
                            viewModel.goToAddWorkOrder = false
                        }
                    } message: {
                        if let selectedTailNumber = viewModel.selectedSquawkTailNumber {
                            Text("Would you like to start a new work order for \(selectedTailNumber) if you haven't already?")
                        } else {
                            Text("Would you like to start a new work order?")
                        }
                    }
                    .fullScreenCover(isPresented: $viewModel.goToAddWorkOrder) {
                        AddWorkOrderView(viewModel: AddWorkOrderViewVM(tailNumber: viewModel.selectedSquawkTailNumber ?? ""))
                    }
                    .task {
                        do {
                            try viewModel.fetchSquawks(for: "@aci")
                        } catch {
                            print(error.localizedDescription)
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
                        viewModel.showNewSquawkView = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title2)
                            .symbolEffect(.variableColor)
                            .foregroundStyle(.airMXGreen)
                    }
                    .fullScreenCover(isPresented: $viewModel.showNewSquawkView) {
                        AddSquawkView()
                    }
                }
            }
        }
    }
}





#Preview {
    SquawkView()
    //viewModel: SquawkViewVM(), squawks: FirestoreQuery(collectionPath: "squawks/@aci/squawks")
    
}
