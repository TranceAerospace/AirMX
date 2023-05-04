    //
    //  ContentView.swift
    //  AirMX
    //
    //  Created by Mark Trance on 2/24/23.
    //

import SwiftUI

struct AddWorkOrderView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @State private var tailNumber = ""
    @State private var aircraftHobbs = ""
    @State private var aircraftCycles = ""
    @State private var workNotes = ""
    
    @State private var showingPartsScreen = false
    @State private var partNumber = ""
    @State private var partSerialNumber = ""

    //@State var newWorkOrder: AircraftWorkOrder?
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Aircraft Info") {
                    TextField("Tail Number", text: $tailNumber)
                    TextField("Aircraft Hobbs", text: $aircraftHobbs)
                        .keyboardType(.decimalPad)
                    TextField("Aircraft Cycles", text: $aircraftCycles)
                        .keyboardType(.decimalPad)
                }
                
                Section("Enter Work Performed Below") {
                    TextEditor(text: $workNotes)
                }
                
                Section("Parts") {
                    
                    Button {
                        showingPartsScreen.toggle()
                    } label: {
                        Text("Click to add Parts")
                    }
                    .sheet(isPresented: $showingPartsScreen) {
                        AddPartsView()
                    }
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
                        // Crude way to test random dates
                    /*
                     let formatter = DateFormatter()
                     formatter.dateFormat = "MM/dd/yyyy"
                     let olddate = formatter.date(from: "12/25/2022")
                     */
                    
//                    newWorkOrder?.id = UUID()
//                    newWorkOrder?.datePerformed = Date().formatted(date: .abbreviated, time: .omitted)
//                    
//                    newWorkOrder?.tailNumber = tailNumber.isEmpty ? "Missing Tail Number" : tailNumber
//                    newWorkOrder?.hobbs = aircraftHobbs.isEmpty ? "Missing Hobbs Time" : aircraftHobbs
//                    newWorkOrder?.cycles = aircraftCycles.isEmpty ? "Missing Cycles" : aircraftCycles
//                    newWorkOrder?.workNotes = workNotes.isEmpty ? "Missing Notes" : workNotes
//                    
//                    
//                    print(newWorkOrder?.parts?.allObjects)
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
