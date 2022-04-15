//
//  PhotoModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import UIKit

struct PhotoModel: Codable, Identifiable {
    let id: Int
    let ownerID: Int
    let sizes: [Size]
    let likes: Likes?
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerID = "owner_id"
        case sizes
        case likes
    }
    
    static func findUrlInPhotoSizes(sizes: [Size], sizesByPriority: [SizeType]) -> (src: String?, ratio: CGFloat) {
        var urlString: String?
        var aspectRatio: CGFloat!
        let tempDict = sizes.reduce(into: [SizeType : (String, CGFloat)]()) { result, next in
            result[next.type] = (next.urlString, next.aspectRatio)
        }
        for sizesByPriority in sizesByPriority {
            urlString = tempDict[sizesByPriority]?.0
            aspectRatio = tempDict[sizesByPriority]?.1
            if urlString != nil { break }
        }
        if urlString == nil { urlString = tempDict.first?.value.0 }
        return (urlString, aspectRatio)
    }
}

struct Size: Codable {
    let urlString: String
    let width: Int
    let height: Int
    let type: SizeType
    var aspectRatio: CGFloat { CGFloat(height) / CGFloat(width) }
    
    enum CodingKeys: String, CodingKey {
        case urlString = "url"
        case width
        case height
        case type
    }
}

// https://vk.com/dev/photo_sizes
enum SizeType: String, Codable {
    case s, m, x, o, p, q, r, y, z, w
}
