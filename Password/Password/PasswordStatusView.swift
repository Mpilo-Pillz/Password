//
//  PasswordStatusView.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/03/02.
//

import UIKit

class PasswordStatusView: UIView {

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
    }

}

extension PasswordStatusView {
    func style() {
        translatesAutoresizingMaskIntoConstraints = true
        backgroundColor = .yellow
    }
    
    func layout() {
        
    }
}
