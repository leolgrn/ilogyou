import Foundation
import XcodeGenKit
import ProjectSpec
import PathKit

public class DirectoriesGenerator {

    public var projectDirectory = ""
    public var projectSourceDirectory = ""
    public var assetsDirectory = ""
    public var appIconDirectory = ""
    public var controllerDirectory = ""
    public var modelDirectory = ""
    public var viewDirectory = ""
    public var classDirectory = ""
    public var providerDirectory = ""

    public var directories: [String] = []

    public init(configuration: Configuration){
        self.projectDirectory = "\(configuration.projectName)"
        self.projectSourceDirectory = "\(configuration.projectName)/\(configuration.projectName)"
        self.assetsDirectory = "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets"
        self.appIconDirectory = "\(configuration.projectName)/\(configuration.projectName)/Assets.xcassets/AppIcon.appiconset"
        self.controllerDirectory = "\(configuration.projectName)/\(configuration.projectName)/Controller"
        self.modelDirectory = "\(configuration.projectName)/\(configuration.projectName)/Model"
        self.viewDirectory = "\(configuration.projectName)/\(configuration.projectName)/View"
        self.classDirectory = "\(configuration.projectName)/\(configuration.projectName)/Model/Class"
        self.providerDirectory = "\(configuration.projectName)/\(configuration.projectName)/Model/Provider"

        self.directories = [
            self.projectDirectory,
            self.projectSourceDirectory,
            self.assetsDirectory,
            self.appIconDirectory,
            self.controllerDirectory,
            self.modelDirectory,
            self.viewDirectory,
            self.classDirectory,
            self.providerDirectory
        ]
    }

    public func generate(){
        self.directories.forEach { (directory) in
            do {
                try FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                print(error.localizedDescription);
            }
        }
    }

}
