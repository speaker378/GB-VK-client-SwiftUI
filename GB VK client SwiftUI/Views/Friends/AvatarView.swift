//
//  AvatarView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 21.03.2022.
//

import SwiftUI

struct AvatarView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: { ProgressView() }
            .modifier(AvatarStyleModifer(diametr: 80))
    }
}

struct AvatarStyleModifer: ViewModifier {
    let diametr: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: diametr, height: diametr)
            .clipShape(Circle())
            .background(Circle().fill(Color.white))
            .shadow(radius: 6, x: -4, y: 4)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static let url = URL(string: "https://picsum.photos/200")
    static var previews: some View {
        AvatarView(url: url)
    }
}
