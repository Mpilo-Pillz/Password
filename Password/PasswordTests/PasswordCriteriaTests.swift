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
