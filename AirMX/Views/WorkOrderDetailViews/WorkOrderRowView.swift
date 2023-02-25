//
//  WorkOrderRowView.swift
//  PerformedX
//
//  Created by Mark Trance on 2/25/23.
//

import SwiftUI

struct WorkOrderRowView: View {
    
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
        HStack {
            Text(label)
                .font(.title3)
            Text(unwrappedItem)
                .foregroundColor(.secondary)
        }
    }
}


struct WorkOrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkOrderRowView(label: "Test", passedItem: "Case")
    }
}
