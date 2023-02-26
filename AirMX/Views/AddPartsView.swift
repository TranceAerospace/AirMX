    //
    //  AddPartsView.swift
    //  AirMX
    //
    //  Created by Mark Trance on 2/25/23.
    //

import SwiftUI

struct AddPartsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
            }
        }
    }
}

struct AddPartsView_Previews: PreviewProvider {
    static var previews: some View {
        AddPartsView()
    }
}
