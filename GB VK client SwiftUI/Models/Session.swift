//
//  Session.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Foundation

final class Session {
    static let shared = Session()
    
    var token = ""
    var userId = 0
    
    private init() {}
}
