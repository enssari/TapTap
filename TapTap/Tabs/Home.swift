//
//  Home.swift
//  TapTap
//
//  Created by Enes Sarı on 8/27/24.
//

import SwiftUI

struct Home: View {    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 195) {
                    Text("For You")
                        .font(.title)
                        .foregroundColor(.yellow)
                    
                    NavigationLink(destination: Search()) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                VideoScreenStatsView()
                    .frame(width: 360, height: 650 ,alignment: .trailing)
                TabBarView()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
