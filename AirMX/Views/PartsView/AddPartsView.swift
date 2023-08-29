//
//  AddPartsView.swift
//  AirMX
//
//  Created by Mark Trance on 2/25/23.
//

import SwiftUI

struct AddPartsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var partNumberOff = ""
    @State private var serialNumberOff = ""
    @State private var partNumberOn = ""
    @State private var serialNumberOn = ""
    @Binding var parts: [Part]
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Off")
                            .foregroundStyle(Color(.airMXRed))
                        TextField("Part Number Off", text: $partNumberOff)
                    }
                    HStack {
                        Text("On")
                            .foregroundStyle(Color(.airMXGreen))
                        TextField("Part Number On", text: $partNumberOn)
                    }
                } header: {
                    Text("Part Number")
                        .underline()
                }
                
                Section {
                    HStack {
                        Text("Off")
                            .foregroundStyle(Color(.airMXRed))
                        TextField("Serial Number Off", text: $serialNumberOff)
                    }
                    HStack {
                        Text("On")
                            .foregroundStyle(Color(.airMXGreen))
                        TextField("Serial Number On", text: $serialNumberOn)
                    }
                } header: {
                    Text("Serial Number")
                        .underline()
                }
                
                Section {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .frame(width: 150, height: 44)
                                .background(.airMXRed)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: 2, x: 4, y: 4)
                        }
                        
                        Spacer()
                        
                        Button {
                            let newPart = Part(id: UUID().uuidString, partNumberOff: partNumberOff, serialNumberOff: serialNumberOff, partNumberOn: partNumberOn, serialNumberOn: serialNumberOn)
                            
                            parts.append(newPart)
                            dismiss()
                            
                        } label: {
                            Text("Add Part")
                                .frame(width: 150, height: 44)
                                .background(.airMXGreen)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: 2, x: 4, y: 4)
                        }
                    }
                }
                .listRowBackground(Color.clear)
            }
            .frame(maxHeight: .infinity)
        }
        .scrollContentBackground(.hidden)
        .background(Color(.airMXBackground))
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    AddPartsView(parts: .constant([Part(id: "12312", partNumberOff: "112312", serialNumberOff: "12312", partNumberOn: "0980", serialNumberOn: "09098")]))
}





//MARK: - Remove this when needed
//
//struct AddPartsView: View {
//    @Environment(\.dismiss) var dismiss
//
//    @State private var partNumberOff = ""
//    @State private var serialNumberOff = ""
//    @State private var partNumberOn = ""
//    @State private var serialNumberOn = ""
//
//    @State private var showAnotherPart = false
//    @State private var newPart: Part?
//    //@Binding var newWorkOrder: AircraftWorkOrder?
//
//
//    var body: some View {
//        VStack {
//            PartsRowView(label: "Part Number Off", passedText: $partNumberOff)
//            PartsRowView(label: "Serial Number Off", passedText: $serialNumberOff)
//            PartsRowView(label: "Part Number On", passedText: $partNumberOn)
//            PartsRowView(label: "Serial Number On", passedText: $serialNumberOn)
//
//            HStack {
//
//                Button {
////                    if let newPart, newWorkOrder != nil {
////
////                        print(newWorkOrder?.parts?.allObjects)
////                    }
//                    dismiss()
//
//                } label: {
//                    Text("Done")
//                        .padding()
//                        .frame(width: 150, height: 44)
//                        .background(.pink)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//
//                if !showAnotherPart {
//                    // TODO: Clean up and possibly extract these buttons.
//                    Button {
////                        //if let newPart, newWorkOrder != nil {
////
////                            newPart.partNumberOff = partNumberOff.isEmpty ? "No old p/n" : partNumberOff
////                            newPart.serialNumberOff = serialNumberOff.isEmpty ? "No old s/n": serialNumberOff
////                            newPart.partNumberOn = partNumberOn.isEmpty ? "no new p/n" : partNumberOn
////                            newPart.serialNumberOn = serialNumberOn.isEmpty ? "no new s/n": serialNumberOn
////
////                           // newWorkOrder?.addToParts(newPart)
////
////                            print(newPart.partNumberOff)
////
////                            showAnotherPart = true
////                            clearOutTextFields()
//                       // }
//
//                    } label: {
//                        Text("Add Part")
//                            .padding()
//                            .frame(width: 150, height: 44)
//                            .background(.green)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                    }
//                } else {
//                    Button {
//
//
//
////                        anotherPart.partNumberOff = partNumberOff.isEmpty ? "No old p/n" : partNumberOff
////                        anotherPart.serialNumberOff = serialNumberOff.isEmpty ? "No old s/n": serialNumberOff
////                        anotherPart.partNumberOn = partNumberOn.isEmpty ? "no new p/n" : partNumberOn
////                        anotherPart.serialNumberOn = serialNumberOn.isEmpty ? "no new s/n": serialNumberOn
////
////                        newWorkOrder?.addToParts(anotherPart)
//
//
//                        //print(newWorkOrder?.parts?.allObjects)
//                        clearOutTextFields()
//
//                    } label: {
//                        Text("Add another Part")
//                            .padding()
//                            .frame(width: 150, height: 44)
//                            .background(.green)
//                            .foregroundColor(.white)
//                            .cornerRadius(8)
//                    }
//                }
//            }
//        }
//        .presentationDetents([.medium])
//    }
//
//    func clearOutTextFields() {
//        partNumberOff = ""
//        serialNumberOff = ""
//        partNumberOn = ""
//        serialNumberOn = ""
//    }
//
//}
//

//
//struct PartsRowView: View {
//    var label: String
//    @Binding var passedText: String
//
//    var body: some View {
//        HStack {
//            Text(label)
//            TextField("", text: $passedText)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 6)
//                        .stroke(.black, lineWidth: 1))
//
//        }
//        .padding()
//    }
//}
