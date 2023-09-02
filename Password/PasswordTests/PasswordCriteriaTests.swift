//
//  PasswordCriteriaTests.swift
//  PasswordTests
//
//  Created by Mpilo Pillz on 2023/09/02.
//

import XCTest

@testable import Password

class PasswordLengthCriteriaTests: XCTestCase {
    // Boundary condition 8-32
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("1234567"))
    }
    
    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteriaMet("0123456789101112131415161718192021222324252627282930313233"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345679"))
    }
    
    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("012345678"))
    }
    
    func testValidVeryLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteriaMet("12345678901234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testLengthAndNoSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("1234567 8"))
    }
    
    func testUpperCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("A"))
    }
    
    func testUpperCaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("a"))
    }
    
    func testLowerCaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("a"))
    }
    
    func testLowerCaseNotMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("A"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("1"))
    }
    
    func testDigitNotMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("a"))
    }
    
    func testSpecicalCharMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet("@"))
    }
    
    func testSpecicalCharNotMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet("a"))
    }
    
    
}


