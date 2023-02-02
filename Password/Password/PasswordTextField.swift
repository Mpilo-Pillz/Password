//
//  PasswordTextField.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/02/01.
//  Color guide https://github.com/jrasmusson/ios-starter-kit/blob/master/basics/Color/README.md
//  quartenary label
//

import UIKit

class PasswordTextField: UIView {
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField = UITextField()
    let placeHolderText: String
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorLabel = UILabel()

    
    
    
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
//        return CGSize(width: 200, height: 200)
//        return CGSize(width: 200, height: 50)
        return CGSize(width: 200, height: 60)
    }
    
}


extension PasswordTextField  {
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
//        backgroundColor = .yellow
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = false // true
        textField.placeholder = placeHolderText
        //        textField.delegate = self
        textField.keyboardType = .asciiCapable // preventing what the user can enter, eg emojies
        textField.attributedPlaceholder = NSAttributedString(string:placeHolderText,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]) // text color of placeholder
        
        
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .systemRed
        errorLabel.font = .preferredFont(forTextStyle: .footnote)
//        errorLabel.text = "Enter your password"
//        errorLabel.text = "Enter your password and again and again and again and again and again"
        errorLabel.text = "Your password must meet the requirements below" // requirements below will go down to a new line so there are no orphan words
        errorLabel.isHidden = false // true
        
//        We can specify a minimum amount we'd like the font to reduce by setting a minimumScaleFactor of 80%. Meaning the font will reduce its in size 80% but no more.
//        errorLabel.adjustsFontSizeToFitWidth = true
//        errorLabel.minimumScaleFactor = 0.8
        
//        If we want the entire body of text into the allocated space regardless of size we can set the scale factor to 0.
//        errorLabel.adjustsFontSizeToFitWidth = true
//        errorLabel.minimumScaleFactor = 0.0
        
//        Going multiline
//        We can make a label multiline like this:
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping // prevents orphan words by default

        
        
        
    }
    
    func layout() {
        addSubview(lockImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorLabel)
        
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
        
        // eye
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // divider
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1)
        ])
        
        // error
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        
        // CHCR
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal) // lock image view i need you to hug yourself and i dont want you to tretch
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal) // text field I need you to stretch
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal) // eye button i need your content hugging to be high, I also need you to hug your self and not streych

    }
}

// MARK: - Actions
extension PasswordTextField {
    @objc func togglePasswordView(_ sender: Any) {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}



