//
//  Gallery.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI
import ASCollectionView

struct Photo: View, Identifiable {
    var id = UUID()
    
    let url = URL(string: "https://picsum.photos/100")
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: { ProgressView() }
            .frame(width: 100, height: 100)
    }
}

struct Gallery: View {
    let friend: Friend
    @State private var photos: [Photo] = Array(repeating: Photo(), count: 11)
    var body: some View {
        ASCollectionView(data: photos) { item, _ in
            item
        }
        .layout {
            .grid(
                layoutMode: .fixedNumberOfColumns(3),
                itemSpacing: 4,
                lineSpacing: 4
            )
        }
    }
}

struct Gallery_Previews: PreviewProvider {
    static let friend: Friend = Friend(id: 0, firstName: "LongFirstName", lastName: "LongLasttName", avatar: Image(systemName: ""))
    static var previews: some View {
        Gallery(friend: friend)
    }
}
