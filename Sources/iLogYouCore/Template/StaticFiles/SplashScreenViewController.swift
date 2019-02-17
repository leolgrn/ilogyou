import Foundation

public class SplashScreenViewController: StaticFile {
    
    public var path: String
    
    public init(configuration: Configuration){
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Controller/SplashScreenViewController.swift"
    }

    public var content = """
    import UIKit

    class SplashScreenViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewDidAppear(_ animated: Bool) {
            let login = LoginViewController()
            self.navigationController?.pushViewController(login, animated: true)
        }

    }
    """

}
