//
//  VideoManager.swift
//  TapTap
//
//  Created by Enes Sarı on 8/30/24.
//

import Foundation

struct VideoScreen: Identifiable, Codable {
    var id = UUID()
    var video: String
    var likes: Int
    var comments: Int
    var shares: Int
    var title: String
    var userImage: String
    var description: String
    var song: String
    
    private enum CodingKeys: String, CodingKey {
        case video, likes, comments, shares, title, userImage, description, song
    }
}

class VideoDataManager {
    static func VideoLoader() -> [VideoScreen]? {
        guard let url = Bundle.main.url(forResource: "Video", withExtension: "json") else {
            print("Could not get the URL")
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Could not get the Data")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            let video = try decoder.decode([VideoScreen].self, from: data)
            return video
        } catch {
            print("Could not read the JSON data")
            return nil
        }
    }
}
