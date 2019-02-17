//
//  XcodeProjGenerator.swift
//  AEXML
//
//  Created by Léo LEGRON on 15/02/2019.
//

import Foundation
import XcodeGenKit
import ProjectSpec
import JSONUtilities
import PathKit

public class XcodeProjGenerator {
    
    public var configuration: Configuration
    
    public init(configuration: Configuration){
        self.configuration = configuration
    }
    
    private func getProjectSpec() -> JSONDictionary {
        return [
            "name": self.configuration.projectName,
            "targets": [
                "\(self.configuration.projectName)": [
                    "type": "application",
                    "platform": "iOS",
                    "deploymentTarget": "10.3",
                    "settings": [
                        "base": [
                            "INFOPLIST_FILE": "\(self.configuration.projectName)/Info.plist",
                            "PRODUCT_BUNDLE_IDENTIFIER": "com.\(self.configuration.projectName)"
                        ]
                    ],
                    "sources":[
                        ["path": self.configuration.projectName]
                    ]
                ]
            ]
        ]
    }
    
    public func generate() {
        do {
            let project = try Project(basePath: Path("\(self.configuration.projectName)"), jsonDictionary: getProjectSpec())
            let projectGenerator = ProjectGenerator(project: project)
            let xcodeproj = try projectGenerator.generateXcodeProject()
            try xcodeproj.write(path: Path("\(self.configuration.projectName)/\(self.configuration.projectName).xcodeproj"))
        } catch let error {
            print("Error : \(error)")
        }
    }
}
