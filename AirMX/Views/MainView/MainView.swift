//
//  MainView.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewVM()
    
    var body: some View {
        VStack {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                // signed In
                accountView
            } else {
                LogInView()
            }
            
            
        }
        
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            WorkOrderListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
