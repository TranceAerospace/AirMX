//
//  DefaultListView.swift
//  AirMX
//
//  Created by Mark Trance on 2/25/23.
//

import SwiftUI

struct EmptyListView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Tap the ")
                Image(systemName: "doc.badge.plus")
                    .foregroundColor(.airMXGreen)
                Text("at the top")
                Image(systemName: "arrow.turn.right.up")
                    .foregroundColor(.airMXRed)
            }
            HStack {
                Text("to get started!")
            }
        }
        .offset(y: -60)
        .frame(maxWidth: 400)
        .font(.title)
    }
}

#Preview {
    NavigationStack {
        EmptyListView()
            .navigationTitle("Stuff")
    }
}
