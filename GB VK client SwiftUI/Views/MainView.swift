//
//  MainView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI

enum Tabs: String {
    case news = "Новости"
    case friends = "Друзья"
    case groups = "Группы"
}

struct MainView: View {
    @State private var selectedTab: Tabs = .news
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                NewsFeedView(viewModel: NewsViewModel())
                    .tabItem { Label("Новости", systemImage: "newspaper") }
                    .tag(Tabs.news)
                FriendsView(viewModel: FriendViewModel())
                    .tabItem { Label("Друзья", systemImage: "person") }
                    .tag(Tabs.friends)
                GroupsView(viewModel: GroupViewModel())
                    .tabItem { Label("Группы", systemImage: "person.3") }
                    .tag(Tabs.groups)
            }
            .navigationTitle(selectedTab.rawValue)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
