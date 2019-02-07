//
//  FileConstructor.swift
//  CodeWriter
//
//  Created by Léo LEGRON on 16/01/2019.
//

import Foundation

public class FileConstructor {
    
    var configuration: Configuration
    
    public init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    public func constructUserModel() -> String {
        var userModel = """
        class CurrentUser {
        
        """
        self.configuration.userClassFields.forEach { (name: String, type: String) in
            userModel += """
                var \(name): \(type)?
            """
        }
        userModel += """

        }
        """
        return userModel
    }
    
    public func constructSignUpViewController() -> String {
        
        var signUpViewController = """
        import UIKit

        class SignUpViewController: UIViewController {

            public var label: UILabel!

        """
        
        self.configuration.userClassFields.forEach { (key: String, value: String) in
            signUpViewController += """
            
            public var \(key): UITextField!
            
            """
        }
        
        signUpViewController += """
        
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
        """
        
        var top = -30
        configuration.userClassFields.forEach { (key: String, value: String) in
            var topString = ""
            if (top > 0){
                topString = "+\(String(top))"
            } else {
                topString = String(top)
            }
           
            signUpViewController += """
            
                \(key) = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2\(topString), width: self.view.frame.width - 100, height: 48))
                \(key).borderStyle = .roundedRect
                \(key).placeholder = "\(key)"
                \(key).spellCheckingType = .no
                \(key).becomeFirstResponder()
                \(key).returnKeyType = .next
                self.view.addSubview(\(key))
            
            """
            top += 60
        }
        
        signUpViewController += """
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
                logInButton.frame = CGRect(x: 0, y: (self.view.frame.height-200)/2 + 70, width: self.view.frame.width, height: 64)
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
                print("hello")
            }
            
            @IBAction func logInButtonEvent(sender: UIButton){
                let viewController = LoginViewController()
                self.present(viewController, animated: false, completion: nil)
            }
        }
        """
        
        return signUpViewController
    }
    
    public func constructXcodeGenConf() -> String {
        return """
        name: \(self.configuration.projectName) # The name of the App
        options: # Some general settings for the project
          createIntermediateGroups: true # If the folders are nested, also nest the groups in Xcode
          indentWidth: 2 # indent by 2 spaces
          tabWidth: 2 # a tab is 2 spaces
          bundleIdPrefix: "com"
        targets: # The List of our targets
          \(self.configuration.projectName):
            type: application
            platform: iOS
            deploymentTarget: "10.3"
            settings:
              base:
                INFOPLIST_FILE: \(self.configuration.projectName)/Info.plist
            sources:
            #Sources
            - path: \(self.configuration.projectName)
        """
    }
    
}
