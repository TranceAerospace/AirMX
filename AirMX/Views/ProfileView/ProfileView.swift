//
//  ProfileView.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var viewModel = ProfileViewVM()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.airMXBackground)
                    .ignoresSafeArea(edges:[.top, .horizontal])
                VStack {
                    if let user = viewModel.user {
                        profileDetails(user: user)
                        
                    } else {
                        Text("Loading Profile...")
                    }
                }
                .toolbar {
                    ToolbarItem {
                        
                        Button {
                            viewModel.logOut()
                        } label: {
                            Text("\(Image(systemName: "capslock.fill")) Logout")
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(.airMXRed))
                    }
                }
                .navigationTitle("Profile")
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profileDetails(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        //Info: Name, Email., Member Since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.emailAddress)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                //Text(Helper.convert(toString: user.joined.dateValue()))
            }
            .padding()
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
