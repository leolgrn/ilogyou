import Foundation

public class UserModel: DynamicFile {
    
    public var configuration: Configuration
    public var path: String
    
    public init(configuration: Configuration){
        self.configuration = configuration
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Model/Class/User.swift"
    }
    
    public func content() -> String {
        return """
        import Foundation
        import SwiftyJSON
        
        class User {
        
            public var email: String
            public var password: String
        \(getProperties())
            public init(email: String, password: String, \(getInitProperties())){
                self.email = email
                self.password = password
        \(getInit())
            }
        
        }
        """
    }
    
    private func getProperties() -> String {
        var properties = ""
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            properties += """
                public var \(name): \(type)\n
            """
        }
        return properties
    }
    
    private func getInitProperties() -> String {
        var properties = ""
        var count = 1
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            if(self.configuration.userClassFields.count == count){
                properties += """
                 \(name): \(type)
                """
            } else {
                properties += """
                 \(name): \(type),
                """
            }
            count += 1
        }
        return properties
    }
    
    private func getInit() -> String {
        var properties = ""
        var count = 1
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            if(self.configuration.userClassFields.count == count){
                properties += """
                        self.\(name) = \(name)
                """
            } else {
                properties += """
                        self.\(name) = \(name)\n
                """
            }
            count += 1
        }
        return properties
    }
    
}
