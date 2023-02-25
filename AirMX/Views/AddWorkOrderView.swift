    //
    //  ContentView.swift
    //  PerformedX
    //
    //  Created by Mark Trance on 2/24/23.
    //

import SwiftUI

struct AddWorkOrderView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var tailNumber = ""
    @State private var aircraftHobbs = ""
    @State private var aircraftCycles = ""
    @State private var workNotes = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Aircraft Info") {
                    TextField("Tail Number", text: $tailNumber)
                    TextField("Aircraft Hobbs", text: $aircraftHobbs)
                    TextField("Aircraft Cycles", text: $aircraftCycles)
                }
                
                Section("Enter Work Performed Below") {
                    TextEditor(text: $workNotes)
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
                    let newWorkOrder = AircraftWorkOrder(context: moc)
                    newWorkOrder.id = UUID()
                    newWorkOrder.datePerformed = Date()
                    newWorkOrder.tailNumber = tailNumber
                    newWorkOrder.hobbs = aircraftHobbs
                    newWorkOrder.cycles = aircraftCycles
                    newWorkOrder.workNotes = workNotes
                    
                    
                    try? moc.save()
                    dismiss()
                } label: {
                    Text("Save")
                        .padding()
                        .frame(width: 150, height: 44)
                        .background(.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkOrderView()
    }
}
