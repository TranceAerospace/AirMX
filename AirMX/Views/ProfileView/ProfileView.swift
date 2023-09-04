//
//  ProfileView.swift
//  AirMX
//
//  Created by Mark Trance on 5/14/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Bindable var viewModel = ProfileViewVM()
    
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
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            viewModel.isEditing.toggle()
                            
                            if !viewModel.isEditing {
                                Task {
                                    do {
                                        try await viewModel.updateProfile(
                                            name: viewModel.name,
                                            organization: viewModel.organization)
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                }
                            }
                            
                        } label: {
                            Text(viewModel.isEditing ? "\(Image(systemName: "lock.open")) Done" :
                                    "\(Image(systemName: "lock.circle")) Edit Profile")
                            .frame(width: 110)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(viewModel.isEditing ? Color(.airMXGreen) : Color(.airMXRed))
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
        //Info: Name, Email, Organization
        Form {
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                        .bold()
                    TextField("Name", text: $viewModel.name)
                        .onChange(of: viewModel.name) {
                            print("changed name")
                        }
                }
                
                HStack {
                    Text("Email: ")
                        .bold()
                    TextField("Email", text: $viewModel.email)
                }
                
                HStack {
                    Text("Organization: ")
                        .bold()
                    TextField("Organization", text: $viewModel.organization)
                        .onChange(of: viewModel.organization) {
                            print("changed organization")
                        }
                    //Helper.convert(toString: user.joined.dateValue()))
                }
                
            }
        }
        .scrollContentBackground(.hidden)
        .disabled(!viewModel.isEditing)
    }
    
    
    
}

#Preview {
    ProfileView()
}
