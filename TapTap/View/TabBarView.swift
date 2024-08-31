//
//  TabBarView.swift
//  TapTap
//
//  Created by Enes Sarı on 8/30/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .foregroundColor(.black)
            }
            HStack(spacing: 25) {
                tabIcon(iconName: "house", iconText: "Main Page")
                tabIcon(iconName: "person.badge.plus", iconText: "Friends")
                addButton()
                tabIcon(iconName: "minus.square", iconText: "Inbox")
                NavigationLink(destination: Profile()) {
                    tabIcon(iconName: "person", iconText: "Profile")
                }
            }
        }
    }
    @ViewBuilder
    func addButton() -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(LinearGradient(colors: [Color("addbutton1"), Color("vividpink")], startPoint: .leading, endPoint: .trailing))
                .frame(width: 55 ,height: 40)
                .cornerRadius(15)
                .offset(y: -5)
                .offset(x: -4)
            
            Rectangle()
                .frame(width: 48, height: 42)
                .foregroundColor(.white)
                .cornerRadius(15)
                .offset(y: -5)
                .offset(x: -4)
            
            Image(systemName: "plus").bold()
                .imageScale(.large)
                .offset(y: -3)
                .offset(x: -4)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    TabBarView()
}

struct tabIcon: View {
    let iconName: String
    let iconText: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 30, height: 30)
            
            Text(iconText)
                .font(.system(size: 14))
                .fontWeight(.medium)
        }
        .foregroundColor(.yellow)
    }
}
