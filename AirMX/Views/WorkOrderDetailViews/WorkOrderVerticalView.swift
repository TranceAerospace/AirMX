//
//  WorkOrderVerticalView.swift
//  PerformedX
//
//  Created by Mark Trance on 2/25/23.
//

import SwiftUI

struct WorkOrderVerticalView: View {
    var label: String
    var passedItem: String?
    
    var unwrappedItem: String {
        if let unwrappedItem = passedItem {
            return unwrappedItem
        } else {
            return "Missing Info"
        }
    }
    
    var body: some View {
        VStack {
            Text(label)
                .font(.title)
            Text(unwrappedItem)
                .foregroundColor(.secondary)
        }
        .padding(.top)
    }
}

struct WorkOrderVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOrderVerticalView(label: "TEST", passedItem: "test")
    }
}
