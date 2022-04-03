//
//  PhotoViewModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Combine

class PhotoViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    private let networkService = NetworkService()
    
    func fetch(userId: Int) {
        networkService.getPhotos(userId: userId) { [weak self] data in
            self?.photos = data
        }
    }
}
