//
//  TestProjectCreation.swift
//  iLogYouTests
//
//  Created by pierre piron on 24/02/2019.
//

import XCTest
import iLogYouCore

class TestProjectCreation: XCTestCase {
    
    func testProjectCreation() {
        let projectName = "UnitTests"
        let configuration = Configuration()
        configuration.projectName = projectName
        configuration.userClassFields["email"] = "String"
        configuration.userClassFields["password"] = "String"
        configuration.userClassFields["age"] = "Int"
        configuration.APIAddress = "127.0.0.1:3000"
        configuration.APIForgotPasswordRoute = "/user/forgot"
        configuration.APILoginRoute = "/user"
        configuration.APISignUpRoute = "/user/signup"
        
        let tool = iLogYou()
        let cli = CLI(configuration: configuration)
        tool.genetareFiles(cli: cli)
        cli.end()
        
        XCTAssert(FileManager.default.fileExists(atPath: projectName))
    }

    
}
