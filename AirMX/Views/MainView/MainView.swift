//
//  MainView.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct MainView: View {
    @State var viewModel = MainViewVM()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                // signed In
                AirMXTabView()
            } else {
                LogInView()
            }
        }
    }
}

#Preview {
    MainView()
}

