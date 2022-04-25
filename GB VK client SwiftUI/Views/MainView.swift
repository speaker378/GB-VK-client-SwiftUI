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
    @StateObject var friendsViewModel = FriendViewModel()
    @StateObject var newsViewModel = NewsViewModel()
    @StateObject var groupsViewModel = GroupViewModel()
    
    var body: some View {
            TabView(selection: $selectedTab) {
                NavigationView {
                NewsFeedView(viewModel: newsViewModel)
                    .tag(Tabs.news)
                }
                .tabItem { Label("Новости", systemImage: "newspaper") }
                NavigationView {
                FriendsView(viewModel: friendsViewModel)
                }
                .tag(Tabs.friends)
                .tabItem { Label("Друзья", systemImage: "person") }
                NavigationView {
                GroupsView(viewModel: groupsViewModel)
                    .tag(Tabs.groups)
                }
                .tabItem { Label("Группы", systemImage: "person.3") }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
