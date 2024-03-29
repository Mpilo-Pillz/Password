//
//  UIResponder+Utils.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/09/02.
//

// determing the first responder
// determin if there is an element actually blocked
// figure out if the element that caused the keboard appreared sits beneeath the keyboard
// then we know that it is hidden


import UIKit

extension UIResponder {

    private struct Static {
        static weak var responder: UIResponder?
    }

    /// Finds the current first responder
    /// - Returns: the current UIResponder if it exists
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}
