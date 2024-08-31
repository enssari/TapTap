//
//  Profile.swift
//  TapTap
//
//  Created by Enes Sarı on 8/27/24.
//

import SwiftUI

struct Profile: View {
    @State private var userinfo: [User] = []
    @State private var showMenu: Bool = false
    @State private var showAccChange: Bool = false
        
    let column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .trailing) {
                    // Top of Page (Nickname and Menu)
                    ForEach(userinfo) { user in
                        HStack {
                            VStack {
                                Button {
                                    showAccChange.toggle()
                                } label: {
                                    Text(user.nickname)
                                        .font(.system(size: 28, weight: .medium))
                                        .foregroundColor(.white)
                                    
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(.white)
                                }
                                .sheet(isPresented: $showAccChange) {
                                    AccountChangeView(showAccChange: $showAccChange)
                                        .presentationDetents([.height(300), .medium])
                                }
                            }
                            
                            Divider()
                                .frame(width: 72, height: 0)
                                                            
                            VStack {
                                Button {
                                    showMenu.toggle()
                                } label: {
                                    Image(systemName: "line.3.horizontal")
                                        .resizable()
                                        .frame(width: 25, height: 20)
                                        .foregroundColor(.white)
                                }
                                .sheet(isPresented: $showMenu) {
                                    ProfileMenuView()
                                        .presentationDetents([.height(300), .large])
                                }
                            }
                        }
                    }
                    
                    UserStatsView()
                    
                    Rectangle()
                        .frame(width: 345, height:  1)
                        .foregroundColor(.secondary)
                    
                }
                .onAppear {
                    if let loadedUser = UserDataManager.loadUser() {
                        userinfo = loadedUser
                    }
                }
                
                VideoScreenView()
                    .padding(.top)
            }
            }
        }
}

#Preview {
    Profile()
}

