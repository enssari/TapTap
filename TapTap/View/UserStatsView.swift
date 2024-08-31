//
//  UserStatsView.swift
//  TapTap
//
//  Created by Enes Sarı on 8/29/24.
//

import SwiftUI

struct UserStatsView: View {
    @State private var userinfo: [User] = []
    
    var body: some View {
        VStack {
            
            // User Photo And Nametag
            ForEach(userinfo) { user in
                if let url = URL(string: user.image) {
                    AsyncImage(url: url) { image in
                            image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(80)
                            .shadow(color: .secondary ,
                                    radius: 1, x: 1, y: 1)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text("@" + user.nametag)
                        .font(.title2)
                        .fontWeight(.medium)
                        .tracking(1.1)
                        .foregroundColor(.black)
                }
            }
            
            // User Stats
            HStack(spacing: 15) {
                ForEach(userinfo) { user in
                    userStatsView(statname: "Followings", stat: "\(user.followings)")
                    Divider()
                        .frame(height: 30)
                    
                    userStatsView(statname: "Followers", stat: "\(user.followers)")
                    Divider()
                        .frame(height: 30)
                    
                    userStatsView(statname: "Likes", stat: "\(user.likes)")
                }
            }
        }
        .onAppear {
            if let loadedUser = UserDataManager.loadUser() {
                userinfo = loadedUser
            }
        }
        
        .padding(.top, 50)
        Spacer()
    }
}

#Preview {
    UserStatsView()
}

struct userStatsView: View {
    
    var statname: String
    var stat: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(stat)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(statname)
                .font(.system(size: 13))
                .tracking(1.2)
                .foregroundColor(.secondary)
                .frame(width: 90)
        }
        .padding(.top)
    }
}
