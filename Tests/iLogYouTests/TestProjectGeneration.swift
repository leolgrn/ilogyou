//
//  TestProjectGeneration.swift
//  AEXML
//
//  Created by Léo LEGRON on 25/02/2019.
//

import XCTest
import iLogYouCore

class TestProjectGeneration: XCTestCase {
    
    var projectName = ""
    var sourceFolder = ""
    
    // Create test project before each tests
    override func setUp() {
        super.setUp()
        
        projectName = "UnitTests"
        sourceFolder = "\(projectName)/\(projectName)/"
        
        let tool = iLogYou()
        let cli = CLI()
        
        cli.configuration.projectName = projectName
        cli.configuration.userClassFields["username"] = "String"
        cli.configuration.userClassFields["age"] = "Int"
        cli.configuration.APIAddress = "127.0.0.1:3000"
        cli.configuration.APIForgotPasswordRoute = "/user/forgot"
        cli.configuration.APILoginRoute = "/user"
        cli.configuration.APISignUpRoute = "/user/signup"
        
        tool.generate(cli: cli)
    }
    
    func testProjectCreation() {
        XCTAssert(FileManager.default.fileExists(atPath: projectName))
    }
    
    func testXcodeProjCreated() {
        let xcodeProjFile = "\(projectName)/\(projectName).xcodeproj"
        XCTAssert(FileManager.default.fileExists(atPath: xcodeProjFile))
    }
    
    func testAppDelegateCreated() {
        let appDelegateFile = "\(sourceFolder)/AppDelegate.swift"
        XCTAssert(FileManager.default.fileExists(atPath: appDelegateFile))
    }
    
    func testinfoPlistCreated() {
        let infoPlistFile = "\(sourceFolder)/Info.plist"
        XCTAssert(FileManager.default.fileExists(atPath: infoPlistFile))
    }
    
    func testControllerFolderCreated() {
        let infoPlistFile = "\(sourceFolder)/Controller"
        XCTAssert(FileManager.default.fileExists(atPath: infoPlistFile))
    }
    
    func testViewFolderCreated() {
        let infoPlistFile = "\(sourceFolder)/View"
        XCTAssert(FileManager.default.fileExists(atPath: infoPlistFile))
    }

    // Remove test project before each tests
    override func tearDown() {
        super.tearDown()
        do {
            try FileManager.default.removeItem(atPath: projectName)
        } catch {
            print("Error while removing tests folder: \(error)")
        }
    }
    
}
