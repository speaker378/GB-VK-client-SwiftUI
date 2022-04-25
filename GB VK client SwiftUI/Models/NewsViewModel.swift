//
//  NewsViewModel.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 03.04.2022.
//

import Combine

class NewsViewModel: ObservableObject {
    @Published var news: [NewsModel] = []
    private let networkService = NetworkService()
    
    func fetch(startTime: Int? = nil,
               startFrom: String? = nil) {
        networkService.getNewsfeed(startTime: startTime, startFrom: startFrom) { [weak self] data, _ in
            self?.news = data
        }
    }
}
