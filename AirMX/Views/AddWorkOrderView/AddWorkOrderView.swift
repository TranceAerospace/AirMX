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
                    
                }
            }
            .padding(.bottom)
            .autocorrectionDisabled(true)
            .navigationTitle("New Work Order")
            
            HStack {
                Button() {
                    
                    dismiss()
                } label: {
                    Text("Cancel")
                        .padding()
                        .frame(width: 150, height: 44)
                        .background(.pink)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button() {
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                        dismiss()
                        
                    } else {
                        viewModel.showAlert = true
                    }
                    
                    //dismiss()
                } label: {
                    Text("Save")
                        .padding()
                        .frame(width: 150, height: 44)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text("Please fill in all fields to add the work order."))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkOrderView(newItemPresented: Binding(get: {return true} , set: { _ in
        }))
    }
}
