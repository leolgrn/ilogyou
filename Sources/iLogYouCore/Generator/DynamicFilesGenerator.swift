//
//  DynamicFilesGenerator.swift
//  AEXML
//
//  Created by Léo LEGRON on 16/02/2019.
//

import Foundation
import XcodeGenKit
import ProjectSpec
import PathKit

public class DynamicFilesGenerator {
    
    public var podFile: PodFile
    public var mainViewControllerXib: MainViewControllerXib
    public var signUpViewController: SignUpViewController
    public var userModel: UserModel
    public var iLogYouProvider: ILogYouProvider
    public var splashScreenViewControllerXib: SplashScreenViewControllerXib
    
    public var dynamicFiles: [DynamicFile] = []
    
    public init(configuration: Configuration){
        self.podFile = PodFile(configuration: configuration)
        self.mainViewControllerXib = MainViewControllerXib(configuration: configuration)
        self.signUpViewController = SignUpViewController(configuration: configuration)
        self.userModel = UserModel(configuration: configuration)
        self.iLogYouProvider = ILogYouProvider(configuration: configuration)
        self.splashScreenViewControllerXib = SplashScreenViewControllerXib(configuration: configuration)
        
        self.dynamicFiles = [
            self.podFile,
            self.mainViewControllerXib,
            self.signUpViewController,
            self.userModel,
            self.iLogYouProvider,
            self.splashScreenViewControllerXib
        ]
    }
    
    public func generate(){
        self.dynamicFiles.forEach { (dynamicFile) in
            do {
                try dynamicFile.content().write(toFile: dynamicFile.path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch let error {
                print("Error while writing \(dynamicFile) : \(error)")
            }
        }
    }
    
}
