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
    @Binding var newPart: Part?
    
    var body: some View {
        VStack {
            PartsRowView(label: "Part Number Off", passedText: $partNumberOff)
            PartsRowView(label: "Serial Number Off", passedText: $serialNumberOff)
            PartsRowView(label: "Part Number On", passedText: $partNumberOn)
            PartsRowView(label: "Serial Number On", passedText: $serialNumberOn)
            
            Button {
                newPart = Part(context: moc)
                if let newPart {

                    newPart.partNumberOff = partNumberOff.isEmpty ? "No old p/n" : partNumberOff
                    newPart.serialNumberOff = serialNumberOff.isEmpty ? "No old s/n": serialNumberOff
                    newPart.partNumberOn = partNumberOn.isEmpty ? "no new p/n" : partNumberOn
                    newPart.serialNumberOn = serialNumberOn.isEmpty ? "no new s/n": serialNumberOn
                    
                    
                    print(newPart.partNumberOff)
                }
                dismiss()
        
            } label: {
                Text("Add Part")
            }
        }
        .presentationDetents([.medium])
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
                //.border(.black)
            
        }
        .padding()
    }
}
