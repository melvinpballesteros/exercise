//
//  Photo.swift
//  app_exercise_mballesteros
//
//  Created by Melvin Ballesteros on 11/24/21.
//

import UIKit

struct Photos: Codable {
    var photos: PhotoDetail
}

struct PhotoDetail: Codable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: Int?
    var stat: String?
    var photo: [Photo]?
}

struct Photo: Codable {
    var id: String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var ispublic: Int?
    var isfriend: Int?
    var isfamily: Int?
}

struct Test: Codable {
    let feature1: String?
}

struct Feature2: Codable {
    let name: String?
}

