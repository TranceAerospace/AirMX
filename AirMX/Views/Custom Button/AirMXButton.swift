//
//  AirMXButton.swift
//  AirMX
//
//  Created by Mark Trance on 5/13/23.
//

import SwiftUI

struct AirMXButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            // ACTION
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        AirMXButton(title: "Value", background: .pink) {
            // Action
        }
    }
}
