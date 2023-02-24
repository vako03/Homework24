//
//  RegisterViewController.swift
//  davaleba24
//
//  Created by anzori  on 2/24/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

   
    @IBOutlet  private weak var usernameTextField: UITextField!
    @IBOutlet  private weak var passwordTextField: UITextField!
    @IBOutlet  private  weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.layer.cornerRadius = 18
        passwordTextField.layer.cornerRadius = 18
        registerButton.layer.borderWidth = 2
        registerButton.layer.cornerRadius = 18
        registerButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
    }
    @objc func registerUser() {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        if username.isEmpty || password.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Please fill in all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        
        let alert = UIAlertController(title: "Success", message: "User registered successfully!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
}



