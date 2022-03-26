//
//  FriendRow.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 18.03.2022.
//

import SwiftUI

struct FriendRow: View {
    let friend: Friend
    let url = URL(string: "https://picsum.photos/200")
    var body: some View {
            HStack(spacing: 16) {
                AvatarView(url: url)
                    .padding(.vertical, 10)
                
                Text("\(friend.firstName) \(friend.lastName)")
                    .font(.system(size: 20))
                
                Spacer()
                
                OnlineStatusView { Circle() }
                    .padding(.bottom, 56)
            }
            .background()
    }
}

struct FriendRow_Previews: PreviewProvider {
    static let friend: Friend = Friend(id: 0, firstName: "LongFirstName", lastName: "LongLasttName", avatar: Image(systemName: ""))
    static var previews: some View {
        List {
            FriendRow(friend: friend)
        }
    }
}

struct OnlineStatusView <Content: Shape>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        content
            .frame(width: 10, height: 10)
            .overlay(Color.green)
            .clipShape(Circle())
    }
}
