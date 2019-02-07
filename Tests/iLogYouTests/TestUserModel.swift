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
        XCTAssertEqual(configuration.APIRoutes, [:])
    }
   
    func testCreateUserModelWith3Fields() {
        let configuration = Configuration()
        configuration.userClassFields["email"] = "string"
        configuration.userClassFields["password"] = "string"
        configuration.userClassFields["age"] = "int"
        
        let fileConstructor = FileConstructor(configuration: configuration)
        let userModel = fileConstructor.constructUserModel()
        
        XCTAssertTrue(userModel.contains("var age: int?"))
        XCTAssertTrue(userModel.contains("var email: string?"))
        XCTAssertTrue(userModel.contains("var password: string?"))
    }
    
    func testCreateUserModelWith1Fields() {
        let configuration = Configuration()
        configuration.userClassFields["username"] = "string"
        
        let fileConstructor = FileConstructor(configuration: configuration)
        let userModel = fileConstructor.constructUserModel()
        
        XCTAssertTrue(userModel.contains("var username: string?"))
        XCTAssertFalse(userModel.contains("var password: string?"))
    }

}
