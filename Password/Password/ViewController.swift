//
//  ViewController.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/02/01.
//

import UIKit

class ViewController: UIViewController {
    let stackView = UIStackView()
    let passwordTextField = PasswordTextField(placeHolderText: "New password")
    let criteriaView = PasswordCriteriaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        criteriaView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
//        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(criteriaView)
        view.addSubview(stackView)
//        view.addSubview(passwordTextField)

                
//                NSLayoutConstraint.activate([
//                    passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                    passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
//        NSLayoutConstraint.activate([
//            passwordTextField.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
//            view.trailingAnchor.constraint(equalToSystemSpacingAfter: passwordTextField.trailingAnchor, multiplier: 1),
//            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])

    }
}

