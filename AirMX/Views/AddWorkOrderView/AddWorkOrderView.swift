//
//  ContentView.swift
//  AirMX
//
//  Created by Mark Trance on 2/24/23.
//

import SwiftUI

struct AddWorkOrderView: View {
    @State var viewModel = AddWorkOrderViewVM()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section {
                    TextField("Tail Number", text: $viewModel.tailNumber)
                    TextField("Aircraft Hobbs", text: $viewModel.aircraftHobbs)
                        .keyboardType(.decimalPad)
                    TextField("Aircraft Cycles", text: $viewModel.aircraftCycles)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Aircraft Info")
                        .fontWeight(.semibold)
                        .underline()
                }
                
                Section {
                    TextEditor(text: $viewModel.workNotes)
                } header: {
                    Text("Enter Work Performed Below")
                        .fontWeight(.semibold)
                        .underline()
                }
                
                
                Section {
                    if viewModel.parts.isEmpty {
                        Text("Add a part to see them listed here.")
                            .font(.subheadline)
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
                            .fontWeight(.semibold)
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
                        .fontWeight(.semibold)
                        .underline()
                }
            }
            .onTapGesture {
                hideKeyboard()
            }
            .scrollContentBackground(.hidden)
            .padding(.bottom)
            .autocorrectionDisabled(true)
            .navigationTitle("New Work Order")
            
            .background(Color(.airMXBackground).ignoresSafeArea())
            
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button() {
                        dismiss()
                    } label: {
//                        Image(systemName: "trash")
//                            .foregroundColor(.airMXRed)
//                            .font(.title2)
                        Text("Cancel")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 120, height: 32)
                            .background(.airMXRed)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 2, x: 2, y: 2)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadWorkOrder()
                            dismiss()
                        }
                    } label: {
//                        Image(systemName: "doc.badge.plus")
//                            .foregroundColor(.airMXGreen)
//                            .font(.title2)


                        Text("Save")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 120, height: 32)
                            .background(.airMXGreen)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .shadow(radius: 2, x: 2, y: 2)
                    }
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text("Please fill in all fields to add the work order."))
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        hideKeyboard()
                    }
                }
            } //: Toolbar end
        }
    }
}

#Preview {
    AddWorkOrderView()
}
