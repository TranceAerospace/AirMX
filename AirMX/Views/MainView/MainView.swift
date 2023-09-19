//
//  MainView.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import SwiftUI
import FirebaseFirestoreSwift

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
            WorkOrderListView(viewModel: WorkOrderListViewVM(userId: viewModel.currentUserId), orders: FirestoreQuery(collectionPath: "users/\(viewModel.currentUserId)/workOrders", predicates: [.order(by:"datePerformed", descending: true)]))
                    .tabItem {
                    Label("Home", systemImage: "house.circle")
                }
            
            SquawkView() 
            //viewModel: SquawkViewVM(), squawks: FirestoreQuery(collectionPath: "squawks/aci/squawks")
                .tabItem {
                    Label("Squawks", systemImage: "exclamationmark.triangle")
                }
 
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
        .tint(Color(.airMXGreen))
    }
}

#Preview {
    MainView()
}

