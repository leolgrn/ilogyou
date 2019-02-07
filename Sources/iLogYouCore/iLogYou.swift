//
//  iLogYou.swift
//  iLogYou
//
//  Created by Léo LEGRON on 07/02/2019.
//

import Foundation

public final class iLogYou {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        let cli = CLI()
        
        cli.welcome()
        cli.askForProjectName()
        //cli.askForUserModelFields()
        //cli.askForAPIAddress()
        //cli.askForAPIRoutes()
        
        let fileGenerator = FileGenerator(configuration: cli.configuration)
        
        fileGenerator.generateDirectories()
        fileGenerator.generateUserModel()
        fileGenerator.generateBasicFiles()
        fileGenerator.generateViewControllers()
        fileGenerator.generateXcodeProj()
        
        cli.end()
    }
}
