//
//  FavoriteModelView.swift
//  davaleba24
//
//  Created by anzori  on 2/25/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

final class FavoriteModelView{
    private let newsWebsService:Service
    
    var resivedInfo: ( ([MovieInfo]) -> Void)?
    
    init(newsWebsService:Service) {
        self.newsWebsService = newsWebsService
    }
    func fachData(){
        newsWebsService.fetchUsers { (Movie) in
            self.resivedInfo!(Movie)
        }
    }
}

