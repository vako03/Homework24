//
//  FavoriteDatasorce.swift
//  davaleba24
//
//  Created by anzori  on 2/25/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

protocol FavoriteViewControlerDataSorceDelegate{
    func didSelectRow(indexPath:IndexPath)
}
class FavoriteDatasorce: NSObject{
    var delegate: FavoriteViewControlerDataSorceDelegate?
    
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
extension FavoriteDatasorce: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath ) as! TableViewCell
        cell.config(wirt: info[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // remove the item from your data source
            info.remove(at: indexPath.row)
            // delete the corresponding row from the table view
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
extension FavoriteDatasorce: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(indexPath: indexPath)
        
        let Info = movie[indexPath.row]
        DataModel.shared.items = [(title:Info.title, description: Info.overview, imageURL: Info.overview, publisheddate:Info.release_date, poster_path: "https://image.tmdb.org/t/p/w500\(Info.poster_path)")]
        }
    
    }
