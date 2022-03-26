//
//  GroupsView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI

struct Group: Identifiable {
    let id: Int
    let name: String
    let avatar: Image
}

struct GroupsView: View {
    @State private var groups: [Group] = [
        Group(id: 0, name: "Hogvarts", avatar: Image(systemName: "")),
        Group(id: 1, name: "Swift", avatar: Image(systemName: ""))
    ]
    
    var body: some View {
        List(groups) { group in
            GroupsRow(group: group)
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupsView()
        }
    }
}
