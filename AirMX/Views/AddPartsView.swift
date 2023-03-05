    //
    //  AddPartsView.swift
    //  AirMX
    //
    //  Created by Mark Trance on 2/25/23.
    //

import SwiftUI

struct AddPartsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    
    @State private var partNumberOff = ""
    @State private var serialNumberOff = ""
    @State private var partNumberOn = ""
    @State private var serialNumberOn = ""
    
    @State private var showAnotherPart = false
    @State private var newPart: Part?
    @Binding var newWorkOrder: AircraftWorkOrder?
    
    
    var body: some View {
        VStack {
            PartsRowView(label: "Part Number Off", passedText: $partNumberOff)
            PartsRowView(label: "Serial Number Off", passedText: $serialNumberOff)
            PartsRowView(label: "Part Number On", passedText: $partNumberOn)
            PartsRowView(label: "Serial Number On", passedText: $serialNumberOn)
            
            HStack {
                
                Button {
//                    if let newPart, newWorkOrder != nil {
//
//                        print(newWorkOrder?.parts?.allObjects)
//                    }
                    dismiss()
                    
                } label: {
                    Text("Done")
                        .padding()
                        .frame(width: 150, height: 44)
                        .background(.pink)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if !showAnotherPart {
                    // TODO: Clean up and possibly extract these buttons.
                    Button {
                        if let newPart, newWorkOrder != nil {
                            
                            newPart.partNumberOff = partNumberOff.isEmpty ? "No old p/n" : partNumberOff
                            newPart.serialNumberOff = serialNumberOff.isEmpty ? "No old s/n": serialNumberOff
                            newPart.partNumberOn = partNumberOn.isEmpty ? "no new p/n" : partNumberOn
                            newPart.serialNumberOn = serialNumberOn.isEmpty ? "no new s/n": serialNumberOn
                            
                            newWorkOrder?.addToParts(newPart)
                            try? moc.save()
                            print(newPart.partNumberOff)
                            
                            showAnotherPart = true
                            clearOutTextFields()
                        }
                        
                    } label: {
                        Text("Add Part")
                            .padding()
                            .frame(width: 150, height: 44)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                } else {
                    Button {
                        
                        let anotherPart = Part(context: moc)
                        
                        anotherPart.partNumberOff = partNumberOff.isEmpty ? "No old p/n" : partNumberOff
                        anotherPart.serialNumberOff = serialNumberOff.isEmpty ? "No old s/n": serialNumberOff
                        anotherPart.partNumberOn = partNumberOn.isEmpty ? "no new p/n" : partNumberOn
                        anotherPart.serialNumberOn = serialNumberOn.isEmpty ? "no new s/n": serialNumberOn
                        
                        newWorkOrder?.addToParts(anotherPart)
                        try? moc.save()
                        
                        print(newWorkOrder?.parts?.allObjects)
                        clearOutTextFields()
                        
                    } label: {
                        Text("Add another Part")
                            .padding()
                            .frame(width: 150, height: 44)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .presentationDetents([.medium])
        .onAppear {
            let newPartItem = Part(context: moc)
            newPart = newPartItem
        }
    }
    
    func clearOutTextFields() {
        partNumberOff = ""
        serialNumberOff = ""
        partNumberOn = ""
        serialNumberOn = ""
    }
    
}

    //struct AddPartsView_Previews: PreviewProvider {
    //    let newPart = Part.empty
    //    static var previews: some View {
    //        let newParts = [Part.empty]
    //        AddPartsView()
    //    }
    //}

struct PartsRowView: View {
    var label: String
    @Binding var passedText: String
    
    var body: some View {
        HStack {
            Text(label)
            TextField("", text: $passedText)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.black, lineWidth: 1))
            
        }
        .padding()
    }
}
