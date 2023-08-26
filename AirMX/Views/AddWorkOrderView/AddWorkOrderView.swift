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
                Color(red: 233/255, green: 216/255, blue: 166/255, opacity: 0.3)
                    .ignoresSafeArea()
                
                Form {
                    Section("Aircraft Info") {
                        TextField("Tail Number", text: $viewModel.tailNumber)
                        TextField("Aircraft Hobbs", text: $viewModel.aircraftHobbs)
                            .keyboardType(.decimalPad)
                        TextField("Aircraft Cycles", text: $viewModel.aircraftCycles)
                            .keyboardType(.decimalPad)
                    }
                    
                    Section("Enter Work Performed Below") {
                        TextEditor(text: $viewModel.workNotes)
                    }
                    
                    Section("Parts") {
                        Button {
                            viewModel.showPartsSheet.toggle()
                        } label: {
                            Label("Add Part", systemImage: "plus.circle.fill")
                                .foregroundStyle(Color(red: 10/255, green: 147/255, blue: 150/255))
                        }
                        .sheet(isPresented: $viewModel.showPartsSheet) {
                            Text("Presentation")
                                .presentationDetents([.medium, .large])
                                .presentationDragIndicator(.hidden)
                        }
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
                            .background(Color(red: 174/255, green: 32/255, blue: 18/255))
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
                            .background(Color(red: 10/255, green: 147/255, blue: 150/255))
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
