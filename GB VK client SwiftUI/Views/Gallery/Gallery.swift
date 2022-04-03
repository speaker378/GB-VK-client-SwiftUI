//
//  Gallery.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI
import ASCollectionView

struct PhotoView: View, Identifiable {
    private let sizesByPriority: [SizeType] = [.x, .y, .z, .w, .r, .q, .p, .m, .o, .s]
    var photo: Photo
    var id = UUID()
    
    init(photo: Photo) {
        self.photo = photo
        self.url = URL(string: Photo.findUrlInPhotoSizes(sizes: photo.sizes, sizesByPriority: sizesByPriority).src ?? "")
    }
    
    var url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: { ProgressView() }
            .frame(width: 100 , height: 100)
    }
}

struct Gallery: View {
    @ObservedObject var viewModel: PhotoViewModel
    let friend: Friend
    
    init(viewModel: PhotoViewModel, friend: Friend) {
        self.viewModel = viewModel
        self.friend = friend
    }
    
    var body: some View {
        ASCollectionView(data: viewModel.photos.map { PhotoView(photo: $0) }) { item, _ in
            item
        }
        .layout {
            .grid(
                layoutMode: .adaptive(withMinItemSize: 100),
                itemSpacing: 4,
                lineSpacing: 4
            )
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
