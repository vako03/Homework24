//
//  UserViewControler.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class UserViewControler: UIViewController {
     let tab = TabBarViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func logOut(_ sender: Any) {
        tab.start()
    }
}
