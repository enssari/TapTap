//
//  VideoScreenContentView.swift
//  TapTap
//
//  Created by Enes Sarı on 8/30/24.
//

import SwiftUI

struct VideoScreenStatsView: View {
    @State private var video: [VideoScreen] = []
    
    var body: some View {
        VStack(spacing: 40) {
            TabView {
                ForEach(video) {video in
                    if let imageUrl = URL(string: video.userImage) {
                        ZStack {
                            VideoScreenView()
                            
                            VStack(alignment: .trailing, spacing: 40) {
                                AsyncImage(url: imageUrl) { image in
                                    image
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                        .shadow(color: Color("lightgray"),
                                                radius: 2, x: 1, y: 1)
                                        .overlay(alignment: .bottom, content: {
                                            Image(systemName: "plus.circle")
                                                .resizable()
                                                .frame(width: 35, height: 35)
                                                .background(Color("vividpink"))
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                                .offset(y: 10)
                                        })
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                VStack(spacing: 40) {
                                    iconView(iconName: "heart.fill", iconText:
                                        String(video.likes))
                                    iconView(iconName: "ellipsis.message.fill", iconText: String(video.comments))
                                    iconView(iconName: "arrowshape.turn.up.right.fill", iconText: String(video.shares))
                                }
                                .padding(.trailing, 15)
                                
                                VideoScreenTextView()
                            }
                            .frame(width: 355, height: 550)
                        }
                    }
                }
            }
        }
        .padding(.top, 50)
        .onAppear{
            if let loadedVideo = VideoDataManager.VideoLoader() {
                video = loadedVideo
            }
        }
    }
}

#Preview {
    VideoScreenStatsView()
}

struct iconView: View {
    
    let iconName: String
    let iconText: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
            Text(String(iconText))
                .fontWeight(.medium)
        }
    }
}
