//
//  PasswordStatusView.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/03/02.
//

import UIKit

class PasswordStatusView: UIView {
    let stackView = UIStackView()
    
    let lengthCriteriaView = PasswordCriteriaView(text: "8-32 characters (no spaces)")
    let uppercaseCriteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    let lowerCaseCriteriaView = PasswordCriteriaView(text: "lowercase (a-z)")
    let digitCriteriaView = PasswordCriteriaView(text: "digit (0-9)")
    let specialCharacterCriteriaView = PasswordCriteriaView(text: "special character (e.g. !@#$%^)")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
        // option 2 reduce parents intrinsic content size
//        200 is too much for the child elements becuase they want to stretch
//        return CGSize(width: 200, height: 160)
    }

}

extension PasswordStatusView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .yellow
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.backgroundColor = .purple
//        Option 4 - set the distribution.
//        Equal centering attempts to set the centers of all the elements to be equal while respectign theri intrinsic content size
        stackView.distribution = .equalCentering
        
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowerCaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        stackView.addArrangedSubview(lengthCriteriaView)
        stackView.addArrangedSubview(uppercaseCriteriaView)
        stackView.addArrangedSubview(lowerCaseCriteriaView)
        stackView.addArrangedSubview(digitCriteriaView)
        stackView.addArrangedSubview(specialCharacterCriteriaView)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
//            Option 3 do not set the bottom anchor, let the stack view nataurally pin it for you, laying things out for you
//            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2)
          
        ])
        
        // Hard coded heights Option 1
//        let height: CGFloat = 20
//        NSLayoutConstraint.activate([
//            lengthCriteriaView.heightAnchor.constraint(equalToConstant: height),
//            uppercaseCriteriaView.heightAnchor.constraint(equalToConstant: height),
//            lowerCaseCriteriaView.heightAnchor.constraint(equalToConstant: height),
//            digitCriteriaView.heightAnchor.constraint(equalToConstant: height),
//            specialCharacterCriteriaView.heightAnchor.constraint(equalToConstant: height),
//        ])
    }
}
