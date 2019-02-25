//
//  TestProjectGeneration.swift
//  AEXML
//
//  Created by Léo LEGRON on 25/02/2019.
//

import XCTest
import iLogYouCore

class TestProjectCreation: XCTestCase {
    
    func testProjectCreation() {
        
        let tool = iLogYou()
        let cli = CLI()
        let projectName = "UnitTests"
        
        cli.configuration.projectName = projectName
        cli.configuration.userClassFields["username"] = "String"
        cli.configuration.userClassFields["age"] = "Int"
        cli.configuration.APIAddress = "127.0.0.1:3000"
        cli.configuration.APIForgotPasswordRoute = "/user/forgot"
        cli.configuration.APILoginRoute = "/user"
        cli.configuration.APISignUpRoute = "/user/signup"
        
        tool.generate(cli: cli)
        
        XCTAssert(FileManager.default.fileExists(atPath: projectName))
    }
    
    
}
