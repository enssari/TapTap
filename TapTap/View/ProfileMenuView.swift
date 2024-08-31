//
//  ProfileMenuView.swift
//  TapTap
//
//  Created by Enes Sarı on 8/29/24.
//

import SwiftUI

struct ProfileMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            MenuItemView(name: "Tiktok Studio", image: "person.badge.key")
            Divider()
            
            MenuItemView(name: "Balance", image: "creditcard")
            Divider()
            
            MenuItemView(name: "My QR Code", image: "qrcode")
            Divider()
            
            MenuItemView(name: "Settings and Privacy", image: "gearshape")
        }
    }
}

#Preview {
    ProfileMenuView()
}

struct MenuItemView: View {
    let name: String
    let image: String
    
    var body: some View {
        HStack {
            Button {
                print("button clicked")
            } label: {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)
                
                Text(name)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.leading, 5)
            }
        }
        .padding(.horizontal, 30)
    }
}
