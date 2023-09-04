//
//  SquawkRowView.swift
//  AirMX
//
//  Created by Mark Trance on 9/3/23.
//

import SwiftUI

struct SquawkRowView: View {
     @Binding var squawkModel: SquawkModel
    
    var body: some View {
        HStack(spacing: 30) {
            Text(squawkModel.tailNumber)
                .font(.caption)
                .frame(width: 60, height: 40)
                .background(.bar)
                .clipShape(.rect(cornerSize: CGSize(width: 10, height: 10), style: .continuous))
                .shadow(radius: 2, x: 2, y: 2)
            
            VStack(alignment: .leading) {
                Text(squawkModel.squawkText)
                    .font(.body)
                    .strikethrough(squawkModel.completed)
                    .bold()
                Text(squawkModel.dateText)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Image(systemName: squawkModel.completed ? "checkmark.diamond.fill": "xmark.diamond.fill")
                .font(.title2)
                .foregroundStyle( squawkModel.completed ? .airMXGreen: .airMXRed)
        }
        
    }
}

#Preview {
    Form {
        SquawkRowView(squawkModel: .constant(SquawkModel(tailNumber: "N893WB", squawkText: "Stuff's Broken", dateText: "9/1/2010")))
    }
}
