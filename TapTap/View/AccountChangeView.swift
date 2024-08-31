//
//  AccountChangeView.swift
//  TapTap
//
//  Created by Enes Sarı on 8/29/24.
//

import SwiftUI

struct AccountChangeView: View {
    @Binding var showAccChange: Bool
    @State private var userInfo: [User] = []
    
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 55) {
                Text("Change Accounts")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Button {
                    showAccChange.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                }
                
            }
            .padding(.leading, 70)
            
            HStack {
                ForEach(userInfo) { user in
                    VStack {
                        let imageUrl: String = user.image
                        
                        if let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(300)
                                    .shadow(color: .secondary,
                                            radius: 1,
                                            x: 1, y: 1)
                                
                            } placeholder: {
                                 ProgressView()
                            }
                        }
                    }
                    
                    Text(user.nickname)
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.leading, 8)
                    
                    VStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.leading, 150)
                            .foregroundColor(.red)
                    }
                }
            }
            
            NavigationLink(destination: Home()) {
                HStack {
                    VStack {
                        Image(systemName: "plus")
                            .font(.system(size: 35, weight: .medium))
                            .foregroundColor(.secondary)
                    }
                    .frame(width: 80, height: 80)
                    .background(Color("lightgray"))
                    .cornerRadius(300)
                    .shadow(color: Color("lightgray"),
                            radius: 1,
                            x: 1, y: 1)
                    
                    Text("Add Account")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.leading, 8)
                        .foregroundColor(.white)
                }
                .frame(width: 342, alignment: .leading)
            }
        }
        .onAppear {
            if let loadedUsers = UserDataManager.loadUser() {
                userInfo = loadedUsers
            }
        }
        .padding(.top)
        Spacer()
    }
}

#Preview {
    AccountChangeView(showAccChange: .constant(false))
}
