//
//  UserManager.swift
//  TapTap
//
//  Created by Enes Sarı on 8/27/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var nickname: String
    var nametag: String
    var image: String
    var followings: Int
    var followers: Int
    var likes: Int
    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case nickname, nametag, image, followings, followers, likes, description
    }
}

class UserDataManager {
    static func loadUser() -> [User]? {
        guard let url = Bundle.main.url(forResource: "UserProfile", withExtension: "json") else {
            print("Could not get the URL")
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("Could not reach the Data")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        do {
            let user = try decoder.decode([User].self, from: data)
            return user
        } catch {
            print("Could not read the JSON data")
            return nil
        }
    }
}
