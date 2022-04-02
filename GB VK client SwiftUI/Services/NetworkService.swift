//
//  NetworkService.swift
//  GB VK client SwiftUI
//
//  Created by Сергей Черных on 02.04.2022.
//

import Foundation

class NetworkService {
    private let clientId = "8014425"
    private let versionAPI = "5.131"
    private let scheme = "https"
    private let host = "api.vk.com"
    private let session = URLSession.shared
    
    // MARK: Friends
    func getFriends(completion: @escaping ([Friend]) -> Void) {
        let path = "/method/friends.get"
        let params = ["fields" : "photo_100,online,friend_status"]
        guard let url = url(from: path, params: params) else { return }
        request(url: url) { json in
            do {
                let friends = try JSONDecoder()
                    .decode(VKResponse<Friend>.self, from: json)
                completion(friends.response.items)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: Private
    private func url(from path: String, params: [String: String]) -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        components.queryItems! += [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: versionAPI),
        ]
        return components.url
    }
    
    private func request(url: URL, completion: @escaping (Data) -> Void) {
        var request = URLRequest(url: url)
        request.timeoutInterval = 10.0
        
        session.dataTask(with: request) { responseData, urlResponse, error in
            guard let response = urlResponse as? HTTPURLResponse,
                  (200...299).contains(response.statusCode),
                  error == nil,
                  let responseData = responseData
            else { return }
            
            DispatchQueue.main.async {
                completion(responseData)
            }
        }
        .resume()
    }
}
