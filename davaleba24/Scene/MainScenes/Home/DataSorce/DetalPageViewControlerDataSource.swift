//
//  DetalPageViewControlerDataSource.swift
//  davaleba24
//
//  Created by Iva Bazhunaishvili on 25.02.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import Foundation
import UIKit

class DetalPageViewControlerDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    private let viewModel: DetailPageViewControllerModelView
    private let collectionView: UICollectionView
    private var movies = [MovieInfo]()
   
    
    init(collectionView: UICollectionView, movieID: Int, viewModel: DetailPageViewControllerModelView) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        super.init()
        
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: MovieCell.id, bundle: nil), forCellWithReuseIdentifier: MovieCell.id)
        
        viewModel.fetchSimilarMovies(as: movieID)
        viewModel.onReceivedMovies = { [weak self] movies in
            self?.movies = movies
            self?.collectionView.reloadData()
            
        }
    }
    
//MARK: - DataSource & FlowLayout methods:
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.id, for: indexPath) as! MovieCell
        let movie = movies[indexPath.item]
        cell.setup(with: movie)
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: 150, height: 150)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//         let collectionWidth = collectionView.bounds.width
//         return CGSize(width: collectionWidth / 3 - 2, height: collectionWidth / 3 - 2)
//     }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//           2
//      }
//      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//           2
//      }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width / 2 - 10 // Set the width to half of the collection view's width
//        let height = width // Set the height to the same as the width to maintain aspect ratio
//        return CGSize(width: width, height: height)
//    }
}
