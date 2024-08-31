//
//  Search.swift
//  TapTap
//
//  Created by Enes Sarı on 8/27/24.
//

import SwiftUI

struct Search: View {
    @State private var searchText: String = ""
    @State private var videos: [VideoScreen] = []
    
    var filteredVideos: [VideoScreen] {
        if searchText.isEmpty {
            return videos
        } else {
            return videos.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            List(filteredVideos) { video in
                VideoScreenView()
            }
            .searchable(text: $searchText, prompt: "Search")
        }
        .onAppear {
            if let loadedVideo = VideoDataManager.VideoLoader() {
                videos = loadedVideo
            }
        }
    }
}

#Preview {
    Search()
}
