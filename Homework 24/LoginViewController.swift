//
//  ViewController.swift
//  Homework 24
//
//  Created by valeri mekhashishvili on 2/24/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private  weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 10
        passwordTextField.layer.cornerRadius = 10
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 20
        registerButton.layer.borderWidth = 2
        registerButton.layer.cornerRadius = 20
        
        
    }


}

