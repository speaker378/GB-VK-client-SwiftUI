//
//  Date+Extension.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 03.04.2022.
//

import Foundation

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
