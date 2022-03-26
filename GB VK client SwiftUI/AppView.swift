//
//  AppView.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 26.03.2022.
//

import SwiftUI

struct AppView: View {
    @State private var isUserAuth: Bool = false
    var body: some View {
        if isUserAuth {
            MainView()
        } else {
            LoginView(isUserAuth: $isUserAuth)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
