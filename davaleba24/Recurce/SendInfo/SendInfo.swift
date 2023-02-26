//
//  SendInfo.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class DataModel {
    static let shared = DataModel()
    var items: [(title: String, description: String, imageURL: String, publisheddate: String,poster_path: String)] = []
}
class addFavorite {
    static let shared = DataModel()
    var items: [(title: String, description: String, imageURL: UIImage, publisheddate: String)] = []
}
class deleteFavorit {
    static let shared = DataModel()
    var items: [(title: String, description: String, imageURL: UIImage, publisheddate: String)] = []
}
