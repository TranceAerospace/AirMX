//
//  ProfileView.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewVM()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 233/255, green: 216/255, blue: 166/255, opacity: 0.3)
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
                        .tint(Color(red: 174/255, green: 32/255, blue: 18/255))
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
                Text(Helper.convert(toString: user.joined.dateValue()))
            }
            .padding()
        }
        .padding()
        // Sign Out
        //        Button("Log Out") {
        //            viewModel.logOut()
        //        }
        //        .tint(.red)
        //        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
