//
//  GB_VK_client_SwiftUIApp.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 13.03.2022.
//

import SwiftUI

@main
struct GB_VK_client_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            AppView()
        }
    }
}
