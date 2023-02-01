//
//  ViewController.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {

    let passwordTextField = PasswordTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(passwordTextField)
                
                NSLayoutConstraint.activate([
                    passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                ])
    }
}

