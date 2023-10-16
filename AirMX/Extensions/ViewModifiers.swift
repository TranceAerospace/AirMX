//
//  Modifiers.swift
//  AirMX
//
//  Created by Mark Trance on 10/15/23.
//

import SwiftUI

struct OnFirstAppearViewModifier: ViewModifier {
    @State private var didAppear: Bool = false
    
    let perform: (() -> Void)?
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !didAppear {
                    perform?()
                    didAppear = false
                }
            }
    }
}
