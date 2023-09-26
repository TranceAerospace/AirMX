//
//  PartsDetailView.swift
//  AirMX
//
//  Created by Mark Trance on 9/21/23.
//

import SwiftUI

struct PartsDetailView: View {
    
    let part: Part
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Part Removed: ")
                Text(part.partNumberOff)
            }
            HStack {
                Text("Part Installed: ")
                Text(part.partNumberOn)
            }
            HStack {
                Text("S/N Removed: ")
                Text(part.serialNumberOff)
            }
            HStack {
                Text("S/N Installed: ")
                Text(part.serialNumberOn)
            }
        }
    }
}

#Preview {
    PartsDetailView(part: Part(id: "", partNumberOff: "12345", serialNumberOff: "12345", partNumberOn: "78910", serialNumberOn: "78910"))
}
