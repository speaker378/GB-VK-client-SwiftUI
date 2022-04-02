//
//  GroupModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Foundation

struct Group: Codable, Identifiable {
    let id: Int
    let name: String
    let avatarUrlString: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarUrlString = "photo_100"
    }
}
