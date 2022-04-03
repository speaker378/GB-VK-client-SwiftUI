//
//  GroupViewModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Combine

class GroupViewModel: ObservableObject {
    var groups: [Group] = []
    private let networkService = NetworkService()
    internal let objectWillChange = ObjectWillChangePublisher()
    
    func fetch() {
        networkService.getGroups { [weak self] data in
            self?.groups = data
            self?.objectWillChange.send()
        }
    }
}
