//
//  UIKit+Extension.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 13.03.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
