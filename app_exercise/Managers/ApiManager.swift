//
//  ApiManager.swift
//  app_exercise_mballesteros
//
//  Created by Melvin Ballesteros on 11/24/21.
//

import UIKit

class ApiManager {
    
    private init(){}
    static let shared = ApiManager()
    
    func get(withUrl url: String, completionBlock: @escaping (Data?, Error?)-> Void) {
        let request = URLRequest(url: URL(string: url)!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 20)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completionBlock(data, error)
            }
        }
        task.resume()
    }
    
    func decode<T: Codable>(_ data: Data) -> T {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode")
        }
        return decodedData
    }
}
