import Foundation

public class SignUpViewController: DynamicFile {
    
    public var configuration: Configuration
    public var path: String
    public var height: Int = 90
    
    public init(configuration: Configuration){
        self.configuration = configuration
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Controller/SignUpViewController.swift"
    }
    
    public func content() -> String {
        return """
        import UIKit
        import Alamofire
        
        class SignUpViewController: UIViewController {
        
            public var label: UILabel!
        
            public var email: UITextField!
            public var password: UITextField!
        \(getProperties())
            var signUpButton: UIButton!
            var logInButton: UIButton!
        
            override func viewDidLoad() {
                super.viewDidLoad()
                addLabel()
                addTextFields()
                addButtons()
                self.logInButton.addTarget(self, action: #selector(logInButtonEvent), for: .touchUpInside)
                self.signUpButton.addTarget(self, action: #selector(signUpButtonEvent), for: .touchUpInside)
                self.view.backgroundColor = UIColor.white
            }
        
            func addTextFields() {
                email = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 - 30, width: self.view.frame.width - 100, height: 48))
                email.borderStyle = .roundedRect
                email.placeholder = "e-mail"
                email.spellCheckingType = .no
                email.becomeFirstResponder()
                email.returnKeyType = .next
                self.view.addSubview(email)
        
                password = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 + 30, width: self.view.frame.width - 100, height: 48))
                password.isSecureTextEntry = true
                password.placeholder = "password"
                password.borderStyle = .roundedRect
                password.spellCheckingType = .no
                password.returnKeyType = .done
                self.view.addSubview(password)
                \(getTextFields())
            }
        
            func addButtons() {
                signUpButton = UIButton(type: .system)
                signUpButton.frame = CGRect(x: 0, y: self.view.frame.height - 64, width: self.view.frame.width, height: 64)
                signUpButton.setTitle("Sign Up", for: .normal)
                signUpButton.setTitleColor(.white, for: .normal)
                signUpButton.backgroundColor = UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1))
                signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
                signUpButton.layer.cornerRadius = 0
                signUpButton.layer.masksToBounds = true
                self.view.addSubview(signUpButton)
        
                logInButton = UIButton(type: .system)
                logInButton.frame = CGRect(x: 0, y: (self.view.frame.height-200)/2 + \(String(self.height)), width: self.view.frame.width, height: 64)
                logInButton.setTitle("Already registered", for: .normal)
                logInButton.setTitleColor(UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1)), for: .normal)
                logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
                self.view.addSubview(logInButton)
            }
        
            func addLabel(){
                label = UILabel(frame: CGRect(x: 50, y: 100, width: self.view.frame.width, height: 48))
                label.text = "Sign Up"
                label.textColor = UIColor.black
                label.font = UIFont.boldSystemFont(ofSize: 30)
                self.view.addSubview(label)
            }
        
            @IBAction func signUpButtonEvent(sender: UIButton){
        
                \(getParameters())
        
                let provider = iLogYouProvider()
        
                provider.signUp(parameters: parameters, callback: { statusCode in
        
                    // execute the code in the main thread
                    DispatchQueue.main.async(execute: {
                        if statusCode == 200 {
                            let login = LoginViewController()
                            self.navigationController?.pushViewController(login, animated: true)
                        }
                        else {
                            print("error - status code : " + String(statusCode))
                        }
                    })
                })
        
            }
        
            @IBAction func logInButtonEvent(sender: UIButton){
                let login = LoginViewController()
                self.navigationController?.pushViewController(login, animated: true)
            }
        
        }
        """
    }
    
    private func getProperties() -> String {
        var properties = ""
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            properties += """
                public var \(name): UITextField!\n
            """
        }
        return properties
    }
    
    private func getParameters() -> String {
        var propertiesBinding = ""
        propertiesBinding += """
        let email = self.email.text!\n
        """
        propertiesBinding += """
                let password = self.password.text!\n
        """
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            propertiesBinding += """
                    let \(name) = self.\(name).text!\n
            """
        }
        var parameters = ""
        var count = 1
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            if( self.configuration.userClassFields.count == count){
                parameters += """
                            "\(name)" : \(name)
                """
            } else {
                parameters += """
                            "\(name)" : \(name),\n
                """
            }
            count += 1
        }
        return """
        \(propertiesBinding)
                let parameters: Parameters = [
                    "email" : email,
                    "password": password,
        \(parameters)
                ]
        """
    }
    
    private func getTextFields() -> String {
        var textFields = ""
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            textFields += """
            
                    \(name) = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 + \(String(self.height)), width: self.view.frame.width - 100, height: 48))
                    \(name).placeholder = "\(name)"
                    \(name).borderStyle = .roundedRect
                    \(name).spellCheckingType = .no
                    \(name).returnKeyType = .done
                    self.view.addSubview(\(name))
            
            """
            self.height += 60
        }
        return textFields
    }
    
    
    
    
}
