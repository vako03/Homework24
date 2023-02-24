//
//  LoginViewController.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var userlogin = Bool()
    let defaults = UserDefaults.standard
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.layer.cornerRadius = 13
        passwordTextField.layer.cornerRadius = 13
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 20
        registerButton.layer.borderWidth = 2
        registerButton.layer.cornerRadius = 20
        loginButton.addTarget(self, action: #selector(loginUser), for: .touchUpInside)
        
    
    }
    
    @objc func loginUser() {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        let savedUsername = UserDefaults.standard.string(forKey: "username")
        let savedPassword = UserDefaults.standard.string(forKey: "password")
        
        if username.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        if username != savedUsername || password != savedPassword {
            let alert = UIAlertController(title: "Error", message: "Incorrect username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            userlogin = false
            return
        }
        
        
       let vc = UIStoryboard(name: "TabBarViewController", bundle: nil).instantiateViewController(identifier: "TabBarViewController") as! TabBarViewController
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
        userlogin = true
        defaults.set(userlogin, forKey: "isLogined")
      
    }

 @IBAction private func onRegister(_ sender: Any) {
     let vc = UIStoryboard(name: "RegisterViewController", bundle: nil).instantiateViewController(identifier: "RegisterViewController") as! RegisterViewController
     navigationController?.pushViewController(vc, animated: true)
   
    }
}


