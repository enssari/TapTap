//
//  VideoScreenTextView.swift
//  TapTap
//
//  Created by Enes Sarı on 8/30/24.
//

import SwiftUI

struct VideoScreenTextView: View {
    @State private var video: [VideoScreen] = []
        
    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            TabView {
                ForEach(video) { video in
                    VStack {
                        Text(video.title)
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        HStack {
                            Image(systemName: "music.note")
                           
                            Text(video.song)
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .onAppear {
            if let loadedVideo = VideoDataManager.VideoLoader() {
                video = loadedVideo
            }
        }
    }
}

#Preview {
    VideoScreenTextView()
}
