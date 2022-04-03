//
//  FriendRow.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 18.03.2022.
//

import SwiftUI

struct FriendRow: View {
    let friend: Friend
    
    var body: some View {
            HStack(spacing: 16) {
                AvatarView(url: URL(string: friend.avatarUrlString))
                    .padding(.vertical, 10)
                
                Text("\(friend.firstName) \(friend.lastName)")
                    .font(.system(size: 20))
                
                Spacer()
                
                OnlineStatusView(status: friend.networkStatus) { Circle() }
                    .padding(.bottom, 56)
            }
            .background()
    }
}

struct FriendRow_Previews: PreviewProvider {
    static let friend: Friend = Friend(id: 0, firstName: "FirstName", lastName: "LastName", avatarUrlString: "", networkStatus: 1, friendStatus: 0)
    static var previews: some View {
        List {
            FriendRow(friend: friend)
        }
    }
}

struct OnlineStatusView <Content: Shape>: View {
    let status: Int?
    let content: Content
    init(status: Int?, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.status = status
    }
    var body: some View {
        content
            .frame(width: 10, height: 10)
            .overlay(status == 1 ? Color.green : Color.gray)
            .clipShape(Circle())
    }
}
