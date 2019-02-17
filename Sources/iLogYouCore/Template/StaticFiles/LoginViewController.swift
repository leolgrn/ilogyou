import Foundation

public class LoginViewController: StaticFile {
    
    public var path: String
    
    public init(configuration: Configuration){
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Controller/LoginViewController.swift"
    }

    public var content = """
    import UIKit

    class LoginViewController: UIViewController {
        
        @IBOutlet weak var testLabel: UILabel!
        public var label: UILabel!
        
        public var email: UITextField!
        public var password: UITextField!
        
        var signUpButton: UIButton!
        var logInButton: UIButton!
        var forgotPasswordButton: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            addLabel()
            addTextFields()
            addButtons()
            self.logInButton.addTarget(self, action: #selector(logInButtonEvent), for: .touchUpInside)
            self.signUpButton.addTarget(self, action: #selector(signUpButtonEvent), for: .touchUpInside)
            self.forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordEvent), for: .touchUpInside)
            self.view.backgroundColor = UIColor.white
        }
        
        func addTextFields() {
            email = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 - 30, width: self.view.frame.width - 100, height: 48))
            email.borderStyle = .roundedRect
            email.placeholder = "e-mail"
            email.spellCheckingType = .no
            email.becomeFirstResponder
            email.returnKeyType = .next
            self.view.addSubview(email)
            
            password = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 + 30, width: self.view.frame.width - 100, height: 48))
            password.isSecureTextEntry = true
            password.placeholder = "password"
            password.borderStyle = .roundedRect
            password.spellCheckingType = .no
            password.returnKeyType = .done
            self.view.addSubview(password)
        }
        
        func addButtons() {
            logInButton = UIButton(type: .system)
            logInButton.frame = CGRect(x: 0, y: self.view.frame.height - 64, width: self.view.frame.width, height: 64)
            logInButton.setTitle("Log in", for: .normal)
            logInButton.setTitleColor(.white, for: .normal)
            logInButton.backgroundColor = UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1))
            logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            logInButton.layer.cornerRadius = 0
            logInButton.layer.masksToBounds = true
            self.view.addSubview(logInButton)
            
            forgotPasswordButton = UIButton(type: .system)
            forgotPasswordButton.frame = CGRect(x: 0, y: (self.view.frame.height-200)/2 + 70, width: self.view.frame.width, height: 64)
            forgotPasswordButton.setTitle("Forgot your password", for: .normal)
            forgotPasswordButton.setTitleColor(UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1)), for: .normal)
            forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
            self.view.addSubview(forgotPasswordButton)
            
            signUpButton = UIButton(type: .system)
            signUpButton.frame = CGRect(x: 0, y: (self.view.frame.height-200)/2 + 100, width: self.view.frame.width, height: 64)
            signUpButton.setTitle("Not registered yet", for: .normal)
            signUpButton.setTitleColor(UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1)), for: .normal)
            signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
            self.view.addSubview(signUpButton)
        }
        
        func addLabel(){
            label = UILabel(frame: CGRect(x: 50, y: 100, width: self.view.frame.width, height: 48))
            label.text = "Log In"
            label.textColor = UIColor.black
            label.font = UIFont.boldSystemFont(ofSize: 30)
            self.view.addSubview(label)
        }
        
        @IBAction func logInButtonEvent(sender: UIButton){
            
            let email = self.email.text!
            let password = self.password.text!
            
            let provider = iLogYouProvider()
            
            provider.login(email: email, password: password, callback: { statusCode in
                
                // execute the code in the main thread
                DispatchQueue.main.async(execute: {
                    if statusCode == 200 {
                        let main = MainViewController()
                        self.navigationController?.pushViewController(main, animated: true)
                    }
                    else {
                        print("error - status code : " + String(statusCode))
                    }
                })
            })
        
        }
        
        @IBAction func signUpButtonEvent(sender: UIButton){
            let signUp = SignUpViewController()
            self.navigationController?.pushViewController(signUp, animated: true)
        }
        
        @IBAction func forgotPasswordEvent(sender: UIButton){
            let forgotPassword = ForgotPasswordViewController()
            self.navigationController?.pushViewController(forgotPassword, animated: true)
        }

    }
    """

}
