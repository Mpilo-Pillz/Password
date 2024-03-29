//
//  PasswordTextField.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/02/01.
//  Color guide https://github.com/jrasmusson/ios-starter-kit/blob/master/basics/Color/README.md
//  quartenary label
//

import UIKit

protocol PasswordTextFieldDelegate: AnyObject {
    /** Friendly reminder that
     * If you want to use this password textfeild
     * You need to comply y implementing the following:
     */
    func editingChanged(_ sender: PasswordTextField)
    /**
     * this is the means we are going to send text back after somone finishes editing
     */
    func editingDidEnd(_ sender: PasswordTextField)
    
}

class PasswordTextField: UIView {
    
    typealias CustomValidation = (_ textValue: String?) -> (Bool, String)?
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField = UITextField()
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorLabel = UILabel()
    
    let placeHolderText: String
    var customValidation: CustomValidation?
    weak var delegate: PasswordTextFieldDelegate?
    
    
    var text: String? {
        get { return textField.text}
        set { textField.text = newValue}
    }
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
                textField.delegate = self
        textField.keyboardType = .asciiCapable // preventing what the user can enter, eg emojies
        textField.attributedPlaceholder = NSAttributedString(string:placeHolderText,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]) // text color of placeholder
        
        
        
//        extra interaction - to giv us the entire word
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
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
        errorLabel.isHidden = true // false
        
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
    
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        delegate?.editingChanged(self)
    }
}

// MARK: - UITextFieldDelegate
extension PasswordTextField: UITextFieldDelegate {
    /**
     * You need to comply so that I can run these for you
     * without caring about you implementation
     * You just confprm and I will do this for you
     */
    func textFieldDidEndEditing(_ textField: UITextField) {
        /**
         * this is where we trigger the means to send back text after
         * someone finished editing
         **/
        delegate?.editingDidEnd(self) // Why are we passing in our self??
        print("end editing \(String(describing: textField.text))")
        // triggers whn focus is lost
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("shouldReturn")
        textField.endEditing(true) // this is where we dismiss the keyboard by resigning first responder
        return true
    }
}

// MARK: - Validation
extension PasswordTextField {
    func validate() -> Bool {
        // unwrapp the custom validation (if there is a custom validation object
        // which there might not be
        if let customValidation = customValidation,
            let customValidationResult = customValidation(text),
            customValidationResult.0 == false {
            showError(customValidationResult.1)
            return false
        }
        clearError()
        return true
    }
    
    private func showError(_ errorMessage: String) {
        errorLabel.isHidden = false
        errorLabel.text = errorMessage
    }

    private func clearError() {
        errorLabel.isHidden = true
        errorLabel.text = ""
    }
}

