//
//  CheckboxView.swift
//  AirMX
//
//  Created by Mark Trance on 2/24/23.
//

import SwiftUI

// UNUSED FOR THE TIME BEING
struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
            // 1
        Button(action: {
            
                // 2
            configuration.isOn.toggle()
            
        }, label: {
            HStack {
                    // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                
                configuration.label
            }
        })
    }
}

