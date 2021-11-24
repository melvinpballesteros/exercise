//
//  MainService.swift
//  app_exercise_mballesteros
//
//  Created by Melvin Ballesteros on 11/24/21.
//

import UIKit

class MainService {
    
    private init(){}
    static let shared = MainService()

    func getImageList(withUrl url: String, completionBlock: @escaping (Photos?, Error?)-> Void) {
        ApiManager.shared.get(withUrl: url) { (data, error) in
            DispatchQueue.main.async {
                if error == nil {
                    let model: Photos = ApiManager.shared.decode(data!)
                    print(model)
                    completionBlock(model, error)
                } else {
                    print(error?.localizedDescription as Any)
                }
            }
        }
    }

}
