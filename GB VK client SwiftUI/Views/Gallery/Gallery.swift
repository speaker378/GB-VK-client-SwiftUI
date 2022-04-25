//
//  Gallery.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI
import ASCollectionView

struct Gallery: View {
    @ObservedObject var viewModel: PhotoViewModel
    let friend: Friend
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .center),
    ]
    
    init(viewModel: PhotoViewModel, friend: Friend) {
        self.viewModel = viewModel
        self.friend = friend
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 0) {
                    if let photos = viewModel.photos {
                        ForEach(photos) {photo in
                            PhotoView(photo: photo)
                                .frame(height: geometry.size.width/3)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetch(userId: friend.id)
        }
    }
}

struct Gallery_Previews: PreviewProvider {
    static let friend: Friend = Friend(id: 0, firstName: "FirstName", lastName: "LastName", avatarUrlString: "", networkStatus: 1, friendStatus: 0)
    static var previews: some View {
        Gallery(viewModel: PhotoViewModel(), friend: friend)
    }
}
