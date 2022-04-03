//
//  Response.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Foundation

struct VKResponse<T:Codable>: Codable {
    let response: Response<T>
}

struct Response<T: Codable>: Codable {
    let items: [T]
    let profiles: [Friend]?
    let groups: [Group]?
    let nextFrom: String?

    enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
        case nextFrom = "next_from"
    }
}
