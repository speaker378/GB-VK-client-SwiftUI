//
//  FriendsView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 26.03.2022.
//

import SwiftUI

struct Friend: Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let avatar: Image
}

struct FriendsView: View {
    @State private var friends: [Friend] = [
        Friend(id: 0, firstName: "Albus", lastName: "Damboldor", avatar: Image(systemName: "mail")),
        Friend(id: 1, firstName: "Harry", lastName: "Potter", avatar: Image(systemName: "eye"))
    ]
    var body: some View {
        List(friends) { friend in
            NavigationLink {
                Gallery(friend: friend)
            } label: {
                FriendRow(friend: friend)
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FriendsView()
        }
    }
}

