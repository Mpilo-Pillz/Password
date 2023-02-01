//
//  PasswordTextField.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/02/01.
//

import UIKit

class PasswordTextField: UIView {
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField = UITextField()
    let placeHolderText: String
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        style()
//        layout()
//    }
    
    // making it reusable so others can determine the text
    init(placeHolderText: String) {
        self.placeHolderText = placeHolderText // this.placeholderText = placeHolderText
        
        // Swift qwirk works dofferntly form other languages
        // make sure all vars are initally set before calling this
        // else it will set error Property "self.placeholderText" not initialized as super,init call
        super.init(frame: .zero)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

extension PasswordTextField {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemCyan
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = false // true
        textField.placeholder = placeHolderText
        //        textField.delegate = self
        textField.keyboardType = .asciiCapable // preventing what the user can enter, eg emojies
        textField.attributedPlaceholder = NSAttributedString(string:placeHolderText,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]) // text color of placeholder
    }
    
    func layout() {
        addSubview(lockImageView)
        addSubview(textField)
        
        // lock
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
        // textfield
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1),
        ])
    }
}
