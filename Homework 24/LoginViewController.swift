//
//  ViewController.swift
//  Homework 24
//
//  Created by valeri mekhashishvili on 2/24/23.
//

import UIKit

class LoginViewController: UIViewController {

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
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(homeVC, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

 @IBAction private func onRegister(_ sender: Any) {
     let registerVC = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
     
     navigationController?.pushViewController(registerVC, animated: true)
   
    }
}

