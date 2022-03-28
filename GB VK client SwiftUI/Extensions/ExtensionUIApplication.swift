//
//  ExtensionUIApplication.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 13.03.2022.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
