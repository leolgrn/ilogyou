//
//  FileGenerator.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 16/01/2019.
//

import Foundation
import XcodeGenKit
import ProjectSpec
import PathKit

public class FileGenerator {
    
    var configuration: Configuration
    var fileConstructor: FileConstructor
    
    public init(configuration: Configuration){
        self.configuration = configuration
        self.fileConstructor = FileConstructor(configuration: self.configuration)
    }
    
    public func generateDirectories(){
        do {
            try FileManager.default.createDirectory(atPath: configuration.projectName, withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/\(configuration.projectName)", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/\(configuration.projectName)/data", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/\(configuration.projectName)/data/dto", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/\(configuration.projectName)/data/model", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/\(configuration.projectName)/Base.lproj", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets", withIntermediateDirectories: false, attributes: nil)
            try FileManager.default.createDirectory(atPath: "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets/AppIcon.appiconset", withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription);
        }
    }
    
    public func generateUserModel(){
        do {
            try fileConstructor.constructUserModel().write(toFile: "\(configuration.projectName)/\(configuration.projectName)/data/model/CurrentUser.swift", atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    public func generateBasicFiles(){
        let launchscreen = BasicFiles.lauchscreenPart1 + configuration.projectName + BasicFiles.launchscreenPart2
        do {
            try BasicFiles.appDelegate.write(toFile: "\(configuration.projectName)/\(configuration.projectName)/AppDelegate.swift", atomically: false, encoding: String.Encoding.utf8)
            try launchscreen.write(toFile: "\(configuration.projectName)/\(configuration.projectName)/Base.lproj/LaunchScreen.storyboard", atomically: false, encoding: String.Encoding.utf8)
            try BasicFiles.contents1.write(toFile: "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets/Contents.json", atomically: false, encoding: String.Encoding.utf8)
            try BasicFiles.contents2.write(toFile: "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets/AppIcon.appiconset/Contents.json", atomically: false, encoding: String.Encoding.utf8)
            try BasicFiles.info.write(toFile: "\(configuration.projectName)/\(configuration.projectName)/Info.plist", atomically: false, encoding: String.Encoding.utf8)
             try fileConstructor.constructXcodeGenConf().write(toFile: "\(configuration.projectName)/project.yml", atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    public func generateViewControllers(){
        do {
            try BasicFiles.loginController.write(toFile: "\(configuration.projectName)/\(configuration.projectName)/LoginViewController.swift", atomically: false, encoding: String.Encoding.utf8)
            try fileConstructor.constructSignUpViewController().write(toFile: "\(configuration.projectName)/\(configuration.projectName)/SignUpViewController.swift", atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    public func generateXcodeProj(){
        let path = Path("\(configuration.projectName)/project.yml")
        let pathXcodeProj = Path("\(configuration.projectName)/\(self.configuration.projectName).xcodeproj")
        var config: Project
        do {
            config = try Project(path: path)
            let projectGenerator = ProjectGenerator.init(project: config)
            let xcodeproj = try projectGenerator.generateXcodeProject()
            try xcodeproj.write(path: pathXcodeProj)
        } catch let error {
            print("Error while writing .xcodeproj file: \(error)")
        }
    }
    
}
