//
//  AppView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 26.03.2022.
//

import SwiftUI

struct AppView: View {
    @State private var isUserAuth: Bool = false
    @AppStorage("vkToken") var token: String?
    
    var body: some View {
        if isUserAuth || token != nil {
//            MainView()
            TabBarCoordinatorView()
        } else {
//            LoginView(isUserAuth: $isUserAuth)
            VKLoginWebView()
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
