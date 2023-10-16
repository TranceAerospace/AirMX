//
//  AirMXTabView.swift
//  AirMX
//
//  Created by Mark Trance on 10/14/23.
//

import SwiftUI

struct AirMXTabView: View {
    var body: some View {
        TabView {
            WorkOrderListView()
            //viewModel: WorkOrderListViewVM(userId: viewModel.currentUserId), orders: FirestoreQuery(collectionPath: "users/\(viewModel.currentUserId)/workOrders", predicates: [.order(by:"datePerformed", descending: true)])
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
    AirMXTabView()
}
