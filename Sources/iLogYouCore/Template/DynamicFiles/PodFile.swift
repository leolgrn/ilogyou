import Foundation

public class PodFile: DynamicFile {
    
    public var configuration: Configuration
    public var path: String
    
    public init(configuration: Configuration){
        self.configuration = configuration
        self.path = "\(configuration.projectName)/Podfile"
    }

    public func content() -> String {
    return """
    # Uncomment the next line to define a global platform for your project
    # platform :ios, '9.0'

    target '\(self.configuration.projectName)' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!

    # Pods for \(self.configuration.projectName)
    pod 'Alamofire'
    pod 'SwiftyJSON'

    end
    """
    }
    
}
