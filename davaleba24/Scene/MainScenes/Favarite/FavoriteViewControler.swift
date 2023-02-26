//
//  FavoriteViewControler.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class FavoriteViewControler: UIViewController {
    var datasorce: FavoriteDatasorce!
    var modelView:  FavoriteModelView!
    var userService: Service?

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        configure()
        viewmodel()
        modelView.fachData()
        datasorce.delegate = self
        alert()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func alert(){
        let alert = UIAlertController(title: "Recommendation", message: "Swipe to delete", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func configure(){
        datasorce = FavoriteDatasorce(with: tableView)
      
    }
    
    func viewmodel(){
        userService = Service.init(webservismanager: WebServiceManager())
        modelView = FavoriteModelView(newsWebsService: userService!)
        modelView.resivedInfo = { Movie in
            self.datasorce!.movie = Movie
            self.tableView.reloadData()
        }
    }

}
extension FavoriteViewControler: FavoriteViewControlerDataSorceDelegate{
    func didSelectRow(indexPath: IndexPath) {
        let vc = UIStoryboard(name: "DetalPageViewControler", bundle: nil).instantiateViewController(identifier: "DetalPageViewControler") as! DetalPageViewControler
        navigationController?.pushViewController(vc, animated: true)
    }
}


