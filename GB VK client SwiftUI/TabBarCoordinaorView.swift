//
//  TabBarCoordinaorView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 10.04.2022.
//

import SwiftUI

struct TabBarCoordinatorView: View {
    
    let friendsViewModel = FriendViewModel()
    let groupsViewModel = GroupViewModel()
    let newsfeddModel = NewsViewModel()
    
    var body: some View {
        UITabBarWrapper([
            TabBarElement(tabBarElementItem: .init(title: "Новости", systemImageName: "newspaper"), {
                NavigationView {
                    NewsFeedView(viewModel: newsfeddModel)
                }
            }),
            
            TabBarElement(tabBarElementItem: .init(title: "Друзья", systemImageName: "person"), {
                NavigationView {
                    FriendsView(viewModel: friendsViewModel )
                }
            }),
            
            TabBarElement(tabBarElementItem: .init(title: "Группы", systemImageName: "person.3"), {
                NavigationView {
                    GroupsView(viewModel: groupsViewModel)
                }
            }),
            
           
        ]).navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
    }
}
