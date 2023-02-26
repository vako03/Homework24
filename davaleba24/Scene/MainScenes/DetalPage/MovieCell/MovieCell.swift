//
//  MovieCell.swift
//  davaleba24
//
//  Created by Iva Bazhunaishvili on 25.02.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {

    static let id = "MovieCell"
    
    @IBOutlet private var imageViewMovieImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setImage(posterPath: String) {
        Service.getMovieImage(from: posterPath) { [weak self] image in
            if let image = image {
                self?.imageViewMovieImage.image = image
            }
        }
    }
    
    func setup(with movie: MovieInfo) {
        setImage(posterPath: movie.poster_path)
    }
}
