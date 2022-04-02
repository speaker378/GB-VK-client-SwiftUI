//
//  FriendModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let avatarUrlString: String
    let networkStatus: Int?
    let friendStatus: Int?
        
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarUrlString =  "photo_100"
        case networkStatus = "online"
        case friendStatus = "friend_status"
    }
}
