//
//  AddSquawkView.swift
//  AirMX
//
//  Created by Mark Trance on 9/7/23.
//

import SwiftUI

struct AddSquawkView: View {
    @Environment(\.dismiss) var dismiss
    @State var tailNumber: String = ""
    @State var squawkText: String = ""
    
    var body: some View {
        NavigationStack {
                VStack {
                    Text("Add a squawk for your entire organization to view.")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                    
                    Form {
                        
                        Section {
                            TextField("Tail Number", text: $tailNumber)
                                .autocorrectionDisabled()
                            
                        } header: {
                            Text("Squawk Info")
                                .underline()
                        }
                        
                        Section {
                            TextEditor(text: $squawkText)
                        } header: {
                            Text("Enter Squawk Details Below")
                                .underline()
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("Add Squawk")
                    
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
                                
                                dismiss()
                                
                            } label: {
                                Text("Save")
                                    .padding()
                                    .frame(width: 150, height: 44)
                                    .background(.airMXGreen)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 2, x: 4, y: 4)
                            }
                        }
                    }
                }
            }
        .background(Color(.airMXBackground).ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        AddSquawkView()
    }
}