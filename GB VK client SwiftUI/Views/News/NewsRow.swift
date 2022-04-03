//
//  NewsRow.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 03.04.2022.
//

import SwiftUI

struct NewsRow: View {
    let news: NewsModel
    var body: some View {
        VStack {
            HStack {
                AvatarView(url: URL(string: news.avatarURL ?? ""))
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    Text(news.creatorName ?? "None")
                        .font(.title2)
                    
                    Text(Date(timeIntervalSince1970: TimeInterval(news.date)).timeAgoDisplay())
                        .font(.subheadline)
                }
                Spacer()
            }
            
            Text(news.text)
                .padding()
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(news: NewsModel(id: UUID(), sourceID: 0, date: 1648993459, text: "Swift is a powerful and intuitive programming language for iOS, iPadOS, macOS, tvOS, and watchOS. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design, yet also produces software that runs lightning-fast.", attachments: nil, comments: Comments(canPost: 1, count: 12, groupsCanPost: nil), likes: Likes(userLikes: 1, count: 33), reposts: Reposts(count: 99, userReposted: 1), views: Views(count: 555), postID: 34, avatarURL: nil, creatorName: nil))
    }
}
