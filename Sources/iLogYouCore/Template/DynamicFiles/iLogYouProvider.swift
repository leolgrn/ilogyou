import Foundation

public class ILogYouProvider: DynamicFile {
    
    public var configuration: Configuration
    public var path: String
    
    public init(configuration: Configuration){
        self.configuration = configuration
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Model/Provider/iLogYouProvider.swift"
    }
    
    public func content() -> String {
        return """
        import Foundation
        import Alamofire
        import SwiftyJSON
        
        class iLogYouProvider {
        
            private var baseURL: String = "\(self.configuration.APIAddress)"
            private var loginRoute: String = "\(self.configuration.APILoginRoute)"
            private var signUpRoute: String = "\(self.configuration.APISignUpRoute)"
            private var forgotPassword: String = "\(self.configuration.APIForgotPasswordRoute)"
        
            func login(email: String, password: String, callback: @escaping (Int) -> ()) {
        
                let loginUrl = URL(string: self.baseURL + self.loginRoute)!
        
                let parameters: Parameters = [
                    "email": email,
                    "password": password
                ]
        
                Alamofire.request(loginUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
        
                    guard let statusCode = response.response?.statusCode else {
                    callback(500)
                    return
                    }
        
                    callback(statusCode)
                }
        
            }
        
        
            func signUp(parameters: Parameters, callback: @escaping (Int) -> ()) {
        
                let signUpUrl = URL(string: self.baseURL + self.signUpRoute)!
        
                Alamofire.request(signUpUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
        
                    guard let statusCode = response.response?.statusCode else {
                        callback(500)
                        return
                    }
        
                    callback(statusCode)
                }
            }
        
            func forgotPassword(parameters: Parameters, callback: @escaping (Int) -> ()) {
        
                let signUpUrl = URL(string: self.baseURL + self.forgotPassword)!
        
                Alamofire.request(signUpUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
        
                    guard let statusCode = response.response?.statusCode else {
                        callback(500)
                        return
                    }
        
                    callback(statusCode)
                }
            }
        }
        """
    }
    
    
    
    
}
