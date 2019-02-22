//
//  TestUserModel.swift
//  iLogYouTests
//
//  Created by pierre piron on 07/02/2019.
//

import XCTest
import iLogYouCore

class TestUserModel: XCTestCase {
    
    func testBlankConfiguration() {
        let configuration = Configuration()
        XCTAssertNotNil(configuration)
        XCTAssertEqual(configuration.projectName, "")
        XCTAssertEqual(configuration.APIAddress, "")
        XCTAssertEqual(configuration.userClassFields, [:])
        XCTAssertEqual(configuration.APILoginRoute, "")
        XCTAssertEqual(configuration.APISignUpRoute, "")
        XCTAssertEqual(configuration.APIForgotPasswordRoute, "")
    }

    func testCreateUserModelWith3Fields() {
        let configuration = Configuration()
        configuration.userClassFields["email"] = "String"
        configuration.userClassFields["password"] = "String"
        configuration.userClassFields["age"] = "Int"
        
        let userModel = UserModel(configuration: configuration)
        
        XCTAssertTrue(userModel.content().contains("var age: Int"))
        XCTAssertTrue(userModel.content().contains("var email: String"))
        XCTAssertTrue(userModel.content().contains("var password: String"))
    }

    func testCreateUserModelWith1Fields() {
        let configuration = Configuration()
        configuration.userClassFields["username"] = "String"
        
        let userModel = UserModel(configuration: configuration)
        
        XCTAssertTrue(userModel.content().contains("var username: String"))
        XCTAssertFalse(userModel.content().contains("var password: String"))
    }

}
