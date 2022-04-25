//
//  NewsFeedView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI

struct NewsFeedView: View {
    @ObservedObject var viewModel: NewsViewModel
    
    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.news) { news in
            NewsRow(news: news)
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewsFeedView(viewModel: NewsViewModel())
        }
    }
}
