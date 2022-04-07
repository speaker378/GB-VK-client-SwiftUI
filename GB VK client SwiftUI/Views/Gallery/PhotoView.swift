//
//  PhotoView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 07.04.2022.
//

import SwiftUI

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

struct PhotoView_Preview: PreviewProvider {
    static let photo = Photo(id: 0, ownerID: 0, sizes: [Size(urlString: "", width: 100, height: 100, type: .x)], likes: Likes(userLikes: 1, count: 21))
    static var previews: some View {
        PhotoView(photo: photo)
    }
}
