//
//  NewsFeedView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 29.03.2022.
//

import SwiftUI

struct NewsFeedView: View {
    var body: some View {
        HStack{
            VStack{
                Image(systemName: "newspaper")
                Text("text news")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewsFeedView()
        }
    }
}
