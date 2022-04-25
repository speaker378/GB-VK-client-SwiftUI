//
//  GroupsRow.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 18.03.2022.
//

import SwiftUI

struct GroupsRow: View {
    let group: Group
    let url = URL(string: "https://picsum.photos/200")
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
                .opacity(0.35)
            
            HStack(spacing: 16) {
                AvatarView(url: url)
                    .padding(.leading, 8)
                    .padding(.vertical, 10)
                
                Text("\(group.name)")
                    .font(.system(size: 22))
                Spacer()
            }
            .background()
        }
    }
}

struct GroupsRow_Previews: PreviewProvider {
    static let group = Group(id: 0, name: "SimpleVeryLongName", avatar: Image(systemName: ""))
    static var previews: some View {
        GroupsRow(group: group)
    }
}

