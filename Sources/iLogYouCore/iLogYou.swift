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
        askForConfiguration(cli: cli)
        genetareFiles(cli: cli)
        cli.end()
    }
    
    public func askForConfiguration(cli: CLI) {
        
        cli.welcome()
        cli.askForProjectName()
        cli.askForUserModelFields()
        cli.askForAPIAddress()
        cli.askForAPILoginRoute()
        cli.askForAPISignUpRoute()
        cli.askForAPIForgotPasswordRoute()
    }
    
    public func genetareFiles(cli: CLI) {
    
        let directoriesGenerator = DirectoriesGenerator(configuration: cli.configuration)
        directoriesGenerator.generate()
        
        let staticFilesGenerator = StaticFilesGenerator(configuration: cli.configuration)
        staticFilesGenerator.generate()
        
        let dynamicFilesGenerator = DynamicFilesGenerator(configuration: cli.configuration)
        dynamicFilesGenerator.generate()
        
        let xcodeProjGenerator = XcodeProjGenerator(configuration: cli.configuration)
        xcodeProjGenerator.generate()
    }
}
