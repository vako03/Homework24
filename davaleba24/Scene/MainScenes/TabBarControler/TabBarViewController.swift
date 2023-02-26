//
//  TabBarViewController.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.hidesBackButton = true
//        guard let viewController1 = self.viewControllers?[0] as? TableViewCell,
//            let viewController2 = self.viewControllers?[1] as? FavoriteViewControler else {
//                return
//    }
//    viewController1.delegate = viewController2
    }
    public func start(){
        UserDefaults.standard.set(false, forKey: "isLogined")
        let vc = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateViewController(identifier: "LoginViewController")
        navigationController?.setViewControllers([vc], animated: true)

    }
  

}
