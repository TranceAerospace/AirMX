//
//  ContentView.swift
//  AirMX
//
//  Created by Mark Trance on 2/24/23.
//

import SwiftUI

struct AddWorkOrderView: View {
    @StateObject var viewModel = AddWorkOrderViewVM()
    
    @Environment(\.dismiss) var dismiss
    @Binding var newItemPresented: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.airMXBackground)
                    .ignoresSafeArea()
                
                Form {
                    Section {
                        TextField("Tail Number", text: $viewModel.tailNumber)
                        TextField("Aircraft Hobbs", text: $viewModel.aircraftHobbs)
                            .keyboardType(.decimalPad)
                        TextField("Aircraft Cycles", text: $viewModel.aircraftCycles)
                            .keyboardType(.decimalPad)
                    } header: {
                        Text("Aircraft Info")
                            .underline()
                    }
                    
                    Section {
                        TextEditor(text: $viewModel.workNotes)
                    } header: {
                        Text("Enter Work Performed Below")
                            .underline()
                    }
                    
                    
                    Section {
                        if viewModel.parts.isEmpty {
                            Text("Add a part to see them listed here.")
                                .foregroundStyle(Color.gray)
                        } else {
                            List(viewModel.parts) { part in
                                Text(part.partNumberOn)
                            }
                        }
                        
                        Button {
                            viewModel.showPartsSheet.toggle()
                        } label: {
                            Label("Add Part", systemImage: "plus.circle.fill")
                                .foregroundStyle(.airMXGreen)
                        }
                        .sheet(isPresented: $viewModel.showPartsSheet) {
                            AddPartsView(parts: $viewModel.parts)
                                .presentationDetents([.height(400)])
                                .presentationDragIndicator(.hidden)
                                .interactiveDismissDisabled()
                        }
                        
                    } header: {
                        Text("Parts")
                            .underline()
                    }
                }
                .scrollContentBackground(.hidden)
                .padding(.bottom)
                .autocorrectionDisabled(true)
                .navigationTitle("New Work Order")
            }
            
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button() {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .padding()
                            .frame(width: 150, height: 44)
                            .background(.airMXRed)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 2, x: 4, y: 4)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                            dismiss()
                            
                        } else {
                            viewModel.showAlert = true
                        }
                        
                    } label: {
                        Text("Save")
                            .padding()
                            .frame(width: 150, height: 44)
                            .background(.airMXGreen)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 2, x: 4, y: 4)
                    }
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text("Please fill in all fields to add the work order."))
                    }
                }
            } //: Toolbar end
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkOrderView(newItemPresented: Binding(get: {return true} , set: { _ in
        }))
    }
}
