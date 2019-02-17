import Foundation
import XcodeGenKit
import ProjectSpec
import PathKit

public class StaticFilesGenerator {
    
    public var assetsContents: AssetsContents
    public var appIconContents: AppIconContents
    public var forgotPasswordViewController: ForgotPasswordViewController
    public var loginViewController: LoginViewController
    public var splashScreenController: SplashScreenViewController
    public var appDelegateController: AppDelegate
    public var infoPlist: Info
    public var mainViewController: MainViewController

    public var staticFiles: [StaticFile] = []
    
    public init(configuration: Configuration){
        
        self.assetsContents = AssetsContents(configuration: configuration)
        self.appIconContents = AppIconContents(configuration: configuration)
        self.forgotPasswordViewController = ForgotPasswordViewController(configuration: configuration)
        self.loginViewController = LoginViewController(configuration: configuration)
        self.splashScreenController = SplashScreenViewController(configuration: configuration)
        self.appDelegateController = AppDelegate(configuration: configuration)
        self.infoPlist = Info(configuration: configuration)
        self.mainViewController = MainViewController(configuration: configuration)
        
        self.staticFiles = [
            self.assetsContents,
            self.appIconContents,
            self.forgotPasswordViewController,
            self.loginViewController,
            self.splashScreenController,
            self.appDelegateController,
            self.infoPlist,
            self.mainViewController
        ]
    }
    
    public func generate(){
        self.staticFiles.forEach { (staticFile) in
            do {
                try staticFile.content.write(toFile: staticFile.path, atomically: false, encoding: String.Encoding.utf8)
            }
            catch let error {
                print("Error while writing \(staticFile) : \(error)")
            }
        }
    }
    
}
