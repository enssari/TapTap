import SwiftUI
import AVKit

struct VideoScreenView: View {
    @State private var video: [VideoScreen] = []
    @State private var player: AVPlayer? = nil
    
    var body: some View {
        ZStack {
            if let player = player {
                VideoPlayer(player: player)
                    .frame(height: 200)
                    .cornerRadius(0)
                    .shadow(radius: 0)
                    .onAppear {
                        player.play() // Start playing the video when the view appears
                    }
            }
        }
        .onAppear {
            if let loadedVideo = VideoDataManager.VideoLoader() {
                video = loadedVideo
                if let videoUrl = URL(string: video.first?.video ?? "") {
                    player = AVPlayer(url: videoUrl)
                    player?.actionAtItemEnd = .none // Prevents pausing at the end
                    NotificationCenter.default.addObserver(
                        forName: .AVPlayerItemDidPlayToEndTime,
                        object: player?.currentItem,
                        queue: .main
                    ) { _ in
                        player?.seek(to: .zero) // Rewind to the beginning
                        player?.play() // Play again
                    }
                }
            }
        }
    }
}

#Preview {
    VideoScreenView()
}
