//
//  FriendsView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 26.03.2022.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject var viewModel: FriendViewModel
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.friends) { friend in
            NavigationLink {
                Gallery(friend: friend)
            } label: {
                FriendRow(friend: friend)
            }
        }
        .onAppear { viewModel.fetch() }
        .listStyle(.plain)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FriendsView(viewModel: FriendViewModel())
        }
    }
}

