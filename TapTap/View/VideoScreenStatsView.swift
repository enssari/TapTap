//
//  VideoScreenContentView.swift
//  TapTap
//
//  Created by Enes Sarı on 8/30/24.
//

import SwiftUI

struct VideoScreenContentView: View {
    @State private var video: [VideoScreen] = []
    
    var body: some View {
        VStack(spacing: 40) {
            ForEach(video) {video in
                if let imageUrl = URL(string: video.userImage) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
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
                }
                
                iconView(iconName: "heart.fill", iconText: String(video.likes))
                iconView(iconName: "ellipsis.comment.fill", iconText: String(video.likes))
                iconView(iconName: "arrowshape.turn.up.right.fill", iconText: String(video.likes))
            }
        }
        .onAppear{
            if let loadedVideo = VideoDataManager.VideoLoader() {
                video = loadedVideo
            }
        }
    }
}

#Preview {
    VideoScreenContentView()
}

struct iconView: View {
    
    let iconName: String
    let iconText: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.white)
            Text(String(iconText))
        }
    }
}
