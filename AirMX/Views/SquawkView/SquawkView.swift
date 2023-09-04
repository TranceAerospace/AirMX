//
//  SquawkView.swift
//  AirMX
//
//  Created by Mark Trance on 9/3/23.
//

import SwiftUI

struct SquawkView: View {
    @State var squawks = SquawkModel.squawkExamples.map { $0 }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.airMXBackground)
                    .ignoresSafeArea()
                
                List($squawks) { $squawk in
                    SquawkRowView(squawkModel: $squawk)
                        .listRowSeparatorTint(.airMXDarkGreen)
                    
                        .swipeActions {
                            Button($squawk.completed.wrappedValue ? "Broke" : "Completed") {
                                $squawk.completed.wrappedValue.toggle()
                            }
                            .tint($squawk.completed.wrappedValue ? .airMXRed : .airMXGreen)
                        }
                }
                .shadow(radius: 2, x: 2, y: 2)
                .scrollContentBackground(.hidden)
                
            }
            .navigationTitle("Squawk List")
        }
    }
}

#Preview {
    SquawkView()
}
