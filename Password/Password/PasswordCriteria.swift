//
//  PasswordCriteria.swift
//  Password
//
//  Created by Mpilo Pillz on 2023/08/19.
//

import Foundation

// making it a struct and not a class becuase we do not need to keep a reference to it
struct PasswordCriteria {
    static func lengthCriteriaMet(_ text: String) -> Bool {
        text.count >= 8 && text.count <= 32
    }
    
    static func noSpaceCriteriaMet(_ text: String) -> Bool {
        text.rangeOfCharacter(from: NSCharacterSet.whitespaces) == nil
    }
    
    static func lengthAndNoSpaceMet(_ text: String) -> Bool {
        lengthCriteriaMet(text) && noSpaceCriteriaMet(text)
    }
    
    static func uppercaseMet(_ text: String) -> Bool {
        text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    static func lowercaseMet(_ text: String) -> Bool {
        text.range(of: "[a-z]+", options: .regularExpression) != nil
    }
    
    static func digitMet(_ text: String) -> Bool {
        text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    static func specialCharacterMet(_ text: String) -> Bool {
         text.range(of: "[@:?!()$#,./\\\\]+", options: .regularExpression) != nil
//        return text.range(of: "[@:?!()$#,./\\\\]+", options: .regularExpression) != nil
    }
}
