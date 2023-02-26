//
//  DetailViewControllerModelView.swift
//  davaleba24
//
//  Created by Iva Bazhunaishvili on 26.02.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import Foundation
import UIKit

final class DetailPageViewControllerModelView {
    private let movieService: Service
    var onReceivedMovies: (([MovieInfo]) -> Void)?
    
    init(movieService: Service) {
        self.movieService = movieService
    }
    
    func fetchSimilarMovies(as movieID: Int) {
        movieService.fetchSimilarMovies(as: movieID) { [weak self] movie in
            DispatchQueue.main.async {
                self?.onReceivedMovies!(movie)
            }
            
        }
    }
    
}
