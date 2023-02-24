//
//  TableViewCell.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    let session = URLSession.shared
    
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var favoriteButton: UIButton!
    @IBOutlet private weak var nameLable: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!
    @IBOutlet private weak var realaisDate: UILabel!
    @IBOutlet private weak var ratingStar: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        movieImage.layer.cornerRadius = 20
    }

  func printStars(array: [Double]) {
  for i in 0..<array.count {
      if array[i] >= 5 {
          ratingStar.text = "⭐⭐⭐⭐⭐"
      }
   else if array[i] <= 4 {
          ratingStar.text = "⭐⭐⭐⭐☆"
      }
    else if array[i] <= 3 {
          ratingStar.text = "⭐⭐⭐☆☆"
      }
   else if array[i] <= 2 {
          ratingStar.text = "⭐⭐☆☆☆"
      }
   else if array[i] >= 1 {
          ratingStar.text = "⭐☆☆☆☆"
      }
  }
}
    func satimage(name:String?)  {
        
        if let posterPath = name,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else {
                    print("Error loading image: \(String(describing: error))")
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.movieImage.image = image
                }
            }
            task.resume()
        }

    }
     func configure(wirt Item:MovieInfo){
         nameLable.text = Item.title
         descriptionLable.text = Item.overview
         let arr = Item.vote_average
         realaisDate.text = Item.release_date
         self.printStars(array: [arr/2])
        satimage(name: Item.poster_path)
     }
    
    
}
