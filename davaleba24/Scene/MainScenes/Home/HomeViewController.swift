//
//  HomeViewController.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//
import UIKit

class HomeViewController: UIViewController {
    var datasorce: HomeViewControllerDataSorce!
    var modelView: HomeViewControlerModelView!
    var userService: Service?
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        spiner.startAnimating()
        configure()
        viewmodel()
        modelView.fachData()
    }
    
    func configure(){
        datasorce = HomeViewControllerDataSorce(with: tableView)
        datasorce?.delegate = self
    }
    func viewmodel(){
        userService = Service.init(webservismanager: WebServiceManager())
        modelView = HomeViewControlerModelView(newsWebsService: userService!)
        modelView.resivedInfo = { Movie in
            self.datasorce!.movie = Movie
            self.tableView.reloadData()
            self.spiner.stopAnimating()
            }
    }

}
extension HomeViewController: HomeViewControlerDataSorceDelegate{
    func didSelectRow(indexPath: IndexPath) {
        let vc = UIStoryboard(name: "DetalPageViewControler", bundle: nil).instantiateViewController(identifier: "DetalPageViewControler") as! DetalPageViewControler
        navigationController?.pushViewController(vc, animated: true)
    }
}
