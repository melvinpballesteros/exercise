//
//  MainViewModel.swift
//  app_exercise_mballesteros
//
//  Created by Melvin Ballesteros on 11/24/21.
//

import UIKit

class MainViewModel {

    var photos = [Photo]()
    
    func fetchImageList(withKeyword keyword: String, completionBlock: @escaping (Error?)-> Void) {
        let url = Url.flickrUrl.replacingOccurrences(of: "REPLACE_TEXT", with: keyword)
        print(url)
        MainService.shared.getImageList(withUrl: url) { (results, error) in
            if error == nil {
                guard let photoImages = results?.photos.photo else { return }
                self.photos = photoImages
                completionBlock(error)
            } else {
                print(error?.localizedDescription as Any)
                completionBlock(error)
            }
        }
    }
    
    func getImageUrl(indexRow: Int)-> String {
        guard let id = photos[indexRow].id else { return "" }
        guard let secret = photos[indexRow].secret else { return "" }
        let imageUrl = "\(Url.baseImageUrl)\(id)_\(secret).jpg"
        print(imageUrl)
        return imageUrl
    }
}
