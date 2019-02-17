import Foundation

public class MainViewController: StaticFile {
    
    public var path: String
    
    public init(configuration: Configuration){
        self.path = "\(configuration.projectName)/\(configuration.projectName)/Controller/MainViewController.swift"
    }
    
    public var content = """
    import UIKit

    // Do your stuff here.

    class MainViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
        }

    }
    """

}
