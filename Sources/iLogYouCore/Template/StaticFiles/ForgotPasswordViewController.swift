import Foundation

public class ForgotPasswordViewController: StaticFile {
    
    public var path: String
    
    public init(configuration: Configuration){
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Controller/ForgotPasswordViewController.swift"
    }

    public var content = """
    import UIKit
    import Alamofire

    class ForgotPasswordViewController: UIViewController {
        
        @IBOutlet weak var testLabel: UILabel!
        public var label: UILabel!
        
        public var email: UITextField!
        
        var loginButton: UIButton!
        var getNewPassword: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            addLabel()
            addTextFields()
            addButtons()
            self.getNewPassword.addTarget(self, action: #selector(getNewPasswordEvent), for: .touchUpInside)
            self.loginButton.addTarget(self, action: #selector(loginButtonEvent), for: .touchUpInside)
            self.view.backgroundColor = UIColor.white
        }
        
        func addTextFields() {
            email = UITextField(frame: CGRect(x: 50, y: (self.view.frame.height-200)/2 - 30, width: self.view.frame.width - 100, height: 48))
            email.borderStyle = .roundedRect
            email.placeholder = "email"
            email.spellCheckingType = .no
            email.becomeFirstResponder
            email.returnKeyType = .next
            self.view.addSubview(email)
        }
        
        func addButtons() {
            getNewPassword = UIButton(type: .system)
            getNewPassword.frame = CGRect(x: 0, y: self.view.frame.height - 64, width: self.view.frame.width, height: 64)
            getNewPassword.setTitle("Get new password", for: .normal)
            getNewPassword.setTitleColor(.white, for: .normal)
            getNewPassword.backgroundColor = UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1))
            getNewPassword.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
            getNewPassword.layer.cornerRadius = 0
            getNewPassword.layer.masksToBounds = true
            self.view.addSubview(getNewPassword)
            
            loginButton = UIButton(type: .system)
            loginButton.frame = CGRect(x: 0, y: (self.view.frame.height-200)/2 + 10, width: self.view.frame.width, height: 64)
            loginButton.setTitle("Remember your password", for: .normal)
            loginButton.setTitleColor(UIColor.init(red: CGFloat(30) / 255, green: CGFloat(144) / 255, blue: CGFloat(255) / 255, alpha: CGFloat(1)), for: .normal)
            loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
            self.view.addSubview(loginButton)
        }
        
        func addLabel(){
            label = UILabel(frame: CGRect(x: 50, y: 100, width: self.view.frame.width, height: 48))
            label.text = "Forgot Password"
            label.textColor = UIColor.black
            label.font = UIFont.boldSystemFont(ofSize: 30)
            self.view.addSubview(label)
        }
        
        @IBAction func getNewPasswordEvent(sender: UIButton){
            
            let email = self.email.text!
            
            let provider = iLogYouProvider()
            
            let parameters: Parameters = [
                "email": email
            ]
            
            provider.forgotPassword(parameters: parameters, callback: { statusCode in
                
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
        
        @IBAction func loginButtonEvent(sender: UIButton){
            let login = LoginViewController()
            self.navigationController?.pushViewController(login, animated: true)
        }
        
    }
    """

}
