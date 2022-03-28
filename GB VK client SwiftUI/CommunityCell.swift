//
//  CommunityCell.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 18.03.2022.
//

import SwiftUI

struct CommunityCell: View {
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
                
                Text("Swift language")
                    .font(.system(size: 22))
                Spacer()
            }
            .background()
            .cornerRadius(18)
            .padding(.horizontal, 12)
        }
    }
}

struct CommunityCell_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCell()
    }
}

