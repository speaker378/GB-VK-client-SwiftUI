//
//  TabBarCoordinator.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 10.04.2022.
//

import Foundation
import SwiftUI

protocol TabBarElementView: View {
    associatedtype Content
    
    var content: Content { get set }
    
    var tabBarElementItem: TabBarElementItem { get set }
}

struct TabBarElementItem {
    var title: String
    var systemImageName: String
}

struct TabBarController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.delegate = context.coordinator
        tabBarController.selectedIndex = 0
        
        return tabBarController
    }
    
    func updateUIViewController(_ tabBarController: UITabBarController, context: Context) {
        tabBarController.setViewControllers(controllers, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, UITabBarControllerDelegate {
    
    var parent: TabBarController
    
    init(_ tabBarController: TabBarController) {
        parent = tabBarController
    }
}

struct TabBarElement: TabBarElementView {
    internal var content: AnyView
    
    var tabBarElementItem: TabBarElementItem
    
    init<Content: View>(tabBarElementItem: TabBarElementItem, @ViewBuilder _ content: () -> Content) {
        self.tabBarElementItem = tabBarElementItem
        self.content = AnyView(content())
    }
    
    var body: some View { self.content }
}

struct UITabBarWrapper: View {
    var controllers: [UIHostingController<TabBarElement>]

    init(_ elements: [TabBarElement]) {
        controllers = elements.enumerated().map {
            let hostingController = UIHostingController(rootView: $1)

            hostingController.tabBarItem = UITabBarItem(
                title: $1.tabBarElementItem.title,
                image: UIImage(systemName: $1.tabBarElementItem.systemImageName),
                tag: $0
            )

            return hostingController
        }
    }

    var body: some View {
        TabBarController(controllers: self.controllers)
    }
}
