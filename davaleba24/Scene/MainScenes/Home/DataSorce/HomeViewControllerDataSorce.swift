//
//  HomeViewControllerDataSorce.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

protocol HomeViewControlerDataSorceDelegate {
    func didSelectRow(movie: MovieInfo, cell: TableViewCell)
}

class HomeViewControllerDataSorce: NSObject {
    var delegate: HomeViewControlerDataSorceDelegate?
    var tableView = UITableView()
    var movie = [MovieInfo]()

    init(with tableView:UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
}
extension HomeViewControllerDataSorce: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath ) as! TableViewCell
        cell.configure(wirt: movie[indexPath.row])
        return cell
    }
    
    
}
extension HomeViewControllerDataSorce: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Info = movie[indexPath.row]
        DataModel.shared.items = [(id: Info.id ,title: Info.title, description: Info.overview, imageURL: Info.overview, publisheddate: Info.release_date, poster_path: "https://image.tmdb.org/t/p/w500\(Info.poster_path)")]
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        delegate?.didSelectRow(movie: Info, cell: cell)
        
        }
        
    }

