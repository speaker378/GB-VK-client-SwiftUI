//
//  NewsModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Foundation

// https://vk.com/dev/newsfeed.get

struct NewsModel: Codable, Identifiable {
    var id = UUID()
    let sourceID: Int // идентификатор источника новости (положительный — новость пользователя, отрицательный — новость группы)
    let date: Int // время публикации новости в формате unixtime
    let text: String
    let attachments: [Attachment]?
    let comments: Comments
    let likes: Likes
    let reposts: Reposts
    let views: Views
    let postID: Int
    var avatarURL: String?
    var creatorName: String?
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case text
        case attachments
        case comments, likes, reposts, views
        case postID = "post_id"
    }
}

struct Attachment: Codable {
    let type: String
    let photo: PhotoModel?
}
