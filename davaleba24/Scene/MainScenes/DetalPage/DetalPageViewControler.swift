//
//  DetalPageViewControler.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class DetalPageViewControler: UIViewController {
    
     
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var textLable: UILabel!
    @IBOutlet private weak var dateLable: UILabel!

    @IBOutlet private var collectionViewSimilarMovies: UICollectionView!
    private var movieService: Service!
    private var viewModel: DetailPageViewControllerModelView!
    private var dataSource: DetalPageViewControlerDataSource!
    var tableViewCell: TableViewCell!
    var movieInfo: MovieInfo!
    
      override func viewDidLoad() {
          super.viewDidLoad()
          image.layer.cornerRadius = 20
          
//          if let item = DataModel.shared.items.first {
//              titleLable.text = item.title
//              textLable.text = item.description
//              dateLable.text = item.publisheddate
//
//              let url = URL(string: item.poster_path)
//              let data = try? Data(contentsOf: url!)
//              if let imageData = data {
//                    self.image.image = UIImage(data: imageData)
//              }
//          }
          
          image.image = tableViewCell._movieImage
          titleLable.text = movieInfo.title
          textLable.text = movieInfo.overview
          dateLable.text = movieInfo.release_date
          
          setupViewModel()
          
    }
    
    private func setupViewModel() {
        movieService = Service(webservismanager: WebServiceManager())
        viewModel = DetailPageViewControllerModelView(movieService: movieService)
        dataSource = DetalPageViewControlerDataSource(collectionView: collectionViewSimilarMovies, movieID: movieInfo.id, viewModel: viewModel)
       // collectionViewSimilarMovies.register(UINib(nibName: MovieCell.id, bundle: nil), forCellWithReuseIdentifier: MovieCell.id)
    }
}
