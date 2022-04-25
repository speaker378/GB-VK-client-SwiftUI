//
//  FriendViewModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Combine

class FriendViewModel: ObservableObject {
    @Published var friends: [Friend] = []
    private let networkService = NetworkService()

    func fetch() {
        networkService.getFriends { [weak self] data in
            self?.friends = data
        }
    }
}
